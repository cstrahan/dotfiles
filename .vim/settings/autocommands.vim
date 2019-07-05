if has("autocmd")
  " misspelling things in git commit messages is embarrassing
  autocmd FileType gitcommit setlocal spell

  " make special characters red (trail, nbsp, extends, precedes)
  "autocmd BufEnter * :hi SpecialKey ctermfg=161 guifg=161

  " disable colorcolumn in quickfix window
  autocmd FileType qf set cc=

  " auto-save everything when vim loses focus
  autocmd FocusLost * silent! wa

  " fix crontab editing
  autocmd BufEnter /private/tmp/crontab.* setlocal backupcopy=yes

  " Close all open buffers on entering a window if the only buffer that's left is
  " the NERDTree buffer
  autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
  function s:CloseIfOnlyNerdTreeLeft()
    if exists("t:NERDTreeBufName")
      if bufwinnr(t:NERDTreeBufName) != -1
        if winnr("$") == 1
          q
        endif
      endif
    endif
  endfunction

  " SBT
  autocmd BufNewFile,BufRead *.sbt set filetype=scala

  " Haskell
  autocmd BufRead,BufNewFile *.hsc set filetype=haskell

  " Rust
  autocmd BufRead,BufNewFile *.rs set filetype=rust

  " Some file types should wrap their text
  function! s:setupWrapping()
    set wrap
    set linebreak
    set textwidth=72
    set nolist
  endfunction

  autocmd FileType make setlocal noexpandtab tabstop=4

  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  autocmd FileType markdown call s:setupWrapping()
  autocmd FileType textile set formatoptions-=t
  autocmd BufNewFile,BufReadPost *.ls setlocal foldmethod=indent nofoldenable
  autocmd BufNewFile,BufReadPost *.ls setlocal foldmethod=indent nofoldenable
  autocmd BufNewFile,BufReadPost *.ls setlocal shiftwidth=2 expandtab

  autocmd BufNewFile,BufRead *.json setlocal ft=javascript

  autocmd FileType python setlocal softtabstop=4 tabstop=4 shiftwidth=4

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g`\"" | endif

  let vimclojure#FuzzyIndent = 1
  autocmd FileType clojure setlocal lispwords+=testing,GET,PUT,POST

  autocmd FileType cs setlocal expandtab shiftwidth=4 softtabstop=4
  autocmd FileType php setlocal expandtab shiftwidth=4 softtabstop=4
  autocmd FileType md setlocal expandtab shiftwidth=2 softtabstop=2
  autocmd FileType haskell setlocal expandtab shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Guardfile,config.ru,*.rake} set ft=ruby
  autocmd BufNewFile,BufRead composer.lock set filetype=javascript

  " Json formatting
  "autocmd FileType json setlocal equalprg=python\ -m\ json.tool
endif
