" Vim filetype plugin file
" Language:     man
" Maintainer:   SungHyun Nam <goweol@gmail.com>
" Last Change:  Sun 24 Jul 2011 01:13:42 AM EEST
" Contributors: Elias Toivanen

" --------------------------------------------------------------------------"
"                            NOTES                                          "
"                                                                           "
"    * Prevents all modifications of man pages and represents them          "
"      as `preview windows'. Man pages are not listed in the buffer         "
"      list and become hidden when closed.                                  "
"                                                                           "
"    * Filetype specific mappings mimic those in Vim's help files.          "
"      <c-]> jumps to the topic under under cursor, whereas <c-t>           "
"      takes you back. You can also double click topics and                 "
"      press <C-RigthMouse> to achieve the same results.                    "
"                                                                           "
"    * Provides two commands :Man and :Whatis and two corresponding         "
"      global mappings <Leader>K and <Leader>W that are enabled             "
"      by appending                                                         "
"                                                                           "
"            ru ftplugin/man.vim                                            "
"                                                                           "
"      to .vimrc. The variable `mapleader' has to be defined to             "
"      make the mappings effective. The first command takes two             "
"      arguments `section' and `page', first of which is optional.          "
"      A preview window with the man page of `page' is opened if found.     "
"      The second command accepts one argument `page' and displays          "
"      a short description of the command in the commandline. Mappings      "
"      achieve the same results except the `section' and `page' arguments   "
"      are found by inspecting the word under the cursor.                   "  
"                                                                           "
"    * Use Vim as your $MANPAGER in bash by appending                       "
"                                                                           "
"      MANPAGER='sh -ec "col -bx | vim -R -c \"set ft=man\" -"'              "
"      export MANPAGER                                                      "
"                                                                           "
"      to your .bashrc.                                                     "
"                                                                           "
" --------------------------------------------------------------------------"

" --------------------------------------------- "
"       Filetype specific settings              "
" --------------------------------------------- "
if &ft == "man"

    " Only do this when not done yet for this buffer
    if exists("b:did_ftplugin")
        finish
    endif
    let b:did_ftplugin = 1

    setlocal ro nomod nomodifiable
    setlocal bufhidden=hide
    setlocal nobuflisted
    setlocal nonu fdc=0
    setlocal buftype=nofile
    setlocal pvw mouse=a " Need mouse support for mappings

    " Allow dot and dash in manual page name.
    setlocal iskeyword+=\.,-

    " Add mappings, unless the user didn't want this.
    if !exists("no_plugin_maps") && !exists("no_man_maps")
        nnoremap <buffer> <c-]> :call <SID>PreviewPageUnderCursor()<CR>
        nnoremap <buffer> <2-LeftMouse> :call <SID>PreviewPageUnderCursor()<CR>
        nnoremap <buffer> <c-t> :call <SID>ManPop()<CR>
        nnoremap <buffer> <C-RightMouse> :call <SID>ManPop()<CR>
    endif

endif

" --------------------------------------------- "
" Command to view man pages from any Vim buffer "
" --------------------------------------------- "

if !exists(":Man")
    com -complete=shellcmd -nargs=+ Man try | call <SID>PreviewPage(<f-args>) | catch /IOError/ | endtry
    nmap <Leader>K :call <SID>PreviewPageUnderCursor()<CR>

    com -complete=shellcmd -nargs=1 Whatis call <SID>Whatis(<f-args>)
    nmap <Leader>W :call <SID>WhatisUnderCursor()<CR>
endif

" Define functions only once.
if !exists("*s:PreviewPage")

    let s:man_sect_arg = ""
    let s:man_find_arg = "-w"
    let s:view_stack = []

    try
        " Override flags for UNIX System V
        if !has("win32") && $OSTYPE !~ 'cygwin\|linux'
        \&& system('uname -s') =~ "SunOS" && system('uname -r') =~ "^5"
            let s:man_sect_arg = "-s"
            let s:man_find_arg = "-l"
        endif
    catch /E145:/
        " Ignore the error in restricted mode
    endtry
    
    function s:GetCmdArg(sect, page)
        if a:sect == ''
            return a:page
        endif
        return s:man_sect_arg.' '.a:sect.' '.a:page
    endfunction

    function s:IsValidPage(args)
        let path = system('/usr/bin/man '.s:man_find_arg.' '.a:args)
        let path = substitute(path, "\n", "", "g")
        return filereadable(path) ? 1 : 0
    endfunction

    function s:PreviewPage(...)
    " Examples
    " :call <SID>PreviewPage(7, regex)
    " :call <SID>PreviewPage(bash)

        if a:0 >= 2
            let sect = a:1
            let page = a:2
        elseif a:0 >= 1
            let sect = ""
            let page = a:1
        else
            return
        endif

        " To support: nmap K :Man <cword>
        if page == '<cword>'
            let page = expand('<cword>')
        endif

        let args = <SID>GetCmdArg(sect, page)

        if !<SID>IsValidPage(args)
            let trail = sect ? "in section ".sect : ""
            echo "No manual entry for `".page."' ".trail
            throw 'IOError'
        endif

        let tmp = tempname()
        let $MANWIDTH = &tw ? &tw : 80 
        let manpager  = shellescape('less -s') " Fixes problems when user has defined $MANPAGER 
        silent execute "!MANPAGER=".manpager." /usr/bin/man ".args."| col -b > ".tmp
        silent execute "pedit ".tmp

        if !has("gui_running")
            redraw!
        endif

      " Cycle once through windows and set the filetype for
      " the newly created preview window. One tab page supports
      " only one preview window, so there cannot be any conflicts
      " about which window to set as a man page.
       for i in range(1, winnr('$'))
           if getwinvar(i, '&pvw')
               " Pulls in 
               " * restricted write permissions
               " * mappings
               " * syntax highlighting.
               call setwinvar(i, "&ft", 'man')
           endif
       endfor

    endfunction

    function s:PreviewPageUnderCursor()
    " Inspects <cword> and calls PreviewPage to view a man
    " page. Stack is updated as a side effect if the 
    " manual page exists.

        let old_isk = &iskeyword
        setl iskeyword+=(,)
        let str = expand("<cword>")
        let &l:iskeyword = old_isk

        let page = substitute(str, '(*\(\k\+\).*', '\1', '')
        let sect = substitute(str, '\(\k\+\)(\([^()]*\)).*', '\2', '')

        if match(sect, '^[0-9 ]\+$') == -1
          let sect = ""
        endif

        if sect == page
          let sect = ""
        endif

        try
            let jump_info = [{bufnr('%'):winsaveview()}]
            call <SID>PreviewPage(sect, page)
        catch /IOError/
            let jump_info = []
        finally
            let s:view_stack += jump_info
        endtry

    endfunction

    function s:ManPop()
    " Pop the last buffer and view from s:view_stack
    " and jump to this buffer and view
        if len(s:view_stack) > 0

            let jump_to = s:view_stack[-1]
            let s:view_stack = s:view_stack[:-2]
            execute keys(jump_to)[0].'buffer'
            call winrestview(values(jump_to)[0])

            " Jumped back to a shell script
            if &ft != 'man'
                pclose
            endif

        else
            echo "Cannot jump to a previous man page: None present"
        endif
        return
    endfunction

    function s:Whatis(topic)
    " Display short description of `topic'

        if a:topic == '<cword>'
            let topic = expand('<cword>')
        else
            let topic = a:topic
        endif

        let descr = system("/usr/bin/man -f ".topic)
        let descr = substitute(descr, "\n", "", "g")
        echo descr
    endfunction

    function s:WhatisUnderCursor()

        let old_isk = &iskeyword
        setl iskeyword+=(,)
        let str = expand("<cword>")
        let &l:iskeyword = old_isk

        let page = substitute(str, '(*\(\k\+\).*', '\1', '')

        call <SID>Whatis(page)

    endfunction

endif

" vim: set sw=4:
