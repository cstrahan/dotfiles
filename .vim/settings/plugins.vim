""" plugin-specific settings

""" Ultisnips

"let g:UltiSnipsExpandTrigger = ...
"let g:UltiSnipsJumpForwardTrigger = ...
"let g:UltiSnipsJumpBackwardTrigger = ...
"let g:UltiSnipsListSnippets = ...

""" Eclim

" vim-classpath stomps on eclim's Java command
command! -buffer -nargs=* Java :call eclim#java#util#Java('', <q-args>)

" make eclim play nicely with YouCompleteMe
let g:EclimCompletionMethod = 'omnifunc'

" disable syntastic support for Java
let g:syntastic_java_checkers=[]
" options: go gofmt golint govet errcheck
let g:syntastic_go_checkers = ['go']

" imports whatever is needed for current line
nnoremap <silent> <LocalLeader>i :JavaImport<cr>
" opens javadoc for statement in browser
nnoremap <silent> <LocalLeader>d :JavaDocSearch -x declarations<cr>
" searches context for statement
nnoremap <silent> <LocalLeader><cr> :JavaSearchContext<cr>
" validates current java file
nnoremap <silent> <LocalLeader>jv :Validate<cr>
" shows corrections for the current line of java
nnoremap <silent> <LocalLeader>jc :JavaCorrect<cr>
" 'open' on OSX will open the url in the default browser without issue
let g:EclimBrowser='open'


""" Verbose (https://github.com/tpope/vim-scriptease/blob/master/plugin/scriptease.vim)
command! -range=999998 -nargs=1 -complete=command Verbose
      \ :exe s:Verbose(<count> == 999998 ? '' : <count>, <q-args>)

function! s:Verbose(level, excmd)
  let temp = tempname()
  let verbosefile = &verbosefile
  call writefile([':'.a:level.'Verbose '.a:excmd], temp, 'b')
  return
        \ 'try|' .
        \ 'let &verbosefile = '.string(temp).'|' .
        \ 'silent '.a:level.'verbose exe '.string(a:excmd).'|' .
        \ 'finally|' .
        \ 'let &verbosefile = '.string(verbosefile).'|' .
        \ 'endtry|' .
        \ 'pedit '.temp.'|wincmd P|nnoremap <buffer> q :bd<CR>'
endfunction


""" Headerguard

nnoremap <leader>hg :HeaderguardAdd<CR>

""" YouCompleteMe
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_confirm_extra_conf = 1
let g:ycm_global_ycm_extra_conf = ''
let g:ycm_extra_conf_globlist = []

""" neocomplcache
let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_enable_at_startup = 1

""" AutoHighlight
nnoremap z/ :if autohighlight#Toggle()<Bar>set hls<Bar>endif<CR>


""" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_excluded_ft = "ruby"
"silent! imap <buffer> <CR> <Plug>delimitMateCR


""" NERDTree

" auto-change CWD when changing tree root
let NERDTreeChDirMode=2
command -n=? -complete=dir NT NERDTreeToggle <args>

let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
let NERDTreeDirArrows=1

" What follows is taken from Janus:

" Default mapping, <leader>n
map <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>

augroup AuNERDTreeCmd
autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction


""" AutoTag
" Make AutoTag play nicely with Fugitive
let g:autotagTagsFile = ".git/tags"
let g:autotagCtagsCmd = "ctags --tag-relative"


""" NERDCommenter

" include space in comments
let g:NERDSpaceDelims = 1
let g:NERDRemoveExtraSpaces = 1


""" Ag
vnoremap <C-a> "hy:Grepper -tool ag -query "<C-r>=escape(@h,'./"*()[]?')<CR>"<CR>
map <leader>a :Grepper -tool ag<cr>
vmap <leader>a "hy:Grepper -tool ag -query "<C-r>=escape(@h,'./"*()[]?')<CR>"<CR>
map <leader>ta :tabnew<CR>:Grepper -tool ag<cr>
vmap <leader>ta "hy:tabnew<CR>:Grepper -tool ag -query "<C-r>=escape(@h,'./"*()[]?')<CR>"<CR>
map <leader>va :vnew<CR>:Grepper -tool ag<cr>
vmap <leader>va "hy:vnew<CR>:Grepper -tool ag -query "<C-r>=escape(@h,'./"*()[]?')<CR>"<CR>


""" surround
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}" " v
let g:surround_35  = "#{\r}" " #

" Select text in an ERb file with visual mode and then press S- or S=
" Or yss- to do entire line.
let g:surround_45 = "<% \r %>"  " -
let g:surround_61 = "<%= \r %>" " =


""" vimclojure
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun=0
let vimclojure#SplitPos="bottom"
let vimclojure#SplitSize=10


""" Fugitive
"nmap <leader>gb :Gblame<CR>
"nmap <leader>gs :Gstatus<CR>
"nmap <leader>gd :Gdiff<CR>
"nmap <leader>gl :Glog<CR>
"nmap <leader>gc :Gcommit<CR>
"nmap <leader>gp :Git push<CR>


""" Command-T
" put commandT window at the top of the screen
"let g:CommandTMatchWindowAtTop=1
let g:CommandTMaxFiles = 20000
let g:CommandTMaxDepth = 15
let g:CommandTMaxCachedDirectories = 1
let g:CommandTMaxHeight = 100
let g:CommandTInputDebounce = 120
let g:CommandTFileScanner = "watchman"
let g:CommandTTagIncludeFilenames = 1
let g:CommandTMatchWindowReverse = 1
let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
silent! nnoremap <unique> <silent> <Leader>p :CommandT<CR>

"map <leader>gt :CommandTTag<cr>
"map <leader>gb :CtrlPBufTag<cr>

""" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }
let g:ctrlp_extensions = ["tag", "buffertag"]
let g:ctrlp_max_height = 100
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_buftag_types = {
      \ 'clojure'     : '--language-force=clojure',
      \ 'rust'        : '--language-force=rust',
      \ }
map <leader>gt :CtrlPTag<cr>
map <leader>gb :CtrlPBufTag<cr>


""" tagbar
map <Leader>rt :TagbarToggle<CR>


""" gist
" detect filetype if vim failed auto-detection.
let g:gist_detect_filetype = 1

" post gists privately by default
" let g:gist_private = 1
" show private gists by default
let g:gist_show_privates = 1

if executable("pbcopy")
  " The copy command
  let g:gist_clip_command = 'pbcopy'
elseif executable("xclip")
  " The copy command
  let g:gist_clip_command = 'xclip -selection clipboard'
elseif executable("putclip")
  " The copy command
  let g:gist_clip_command = 'putclip'
end


""" copy-as-rtf/TOhtml
" tell TOhtml to disable line numbering when generating HTML
let g:html_number_lines=0
" and to use a reasonable font
let g:html_font="Menlo"


""" zencoding
let g:user_zen_settings = {
\  'indentation' : '  '
\}

""" switch.vim
"nnoremap - :Switch<cr>

""" align: disable alignmaps
"let g:loaded_AlignMapsPlugin=1

""" tabular
" http://src.chuckg.org/rcfiles/src/6b15c9ad4d29/vimrc/.vimrc
" https://github.com/cdlm/infrastructure/blob/master/dotfiles/vim/after/plugin/tabular-patterns.vim
if exists(":Tabularize")
  function! CustomTabularPatterns()
      if exists('g:tabular_loaded')
          AddTabularPattern! assignment      / = /l0
          AddTabularPattern! chunks          / \S\+/l0
          AddTabularPattern! colon           /:\zs /l0
          AddTabularPattern! first_comma     /^[^,]*,/l1
          AddTabularPattern! comma           /,\zs /l0
          AddTabularPattern! first_hash      /^[^>]*\zs=>/
          AddTabularPattern! hash            / => \|,\zs /l0
          AddTabularPattern! options_hashes  /:\w\+ =>/
          AddTabularPattern! symbols         / :/l0
          AddTabularPattern! space           /^\s*\S*\zs\s/l0
      endif
  endfunction
  autocmd VimEnter * call CustomTabularPatterns()

  map <leader>a= :Tabularize assignment<CR>
  map <leader>a: :Tabularize colon<CR>
  map <leader>a, :Tabularize comma<CR>
  map <leader>a> :Tabularize hash<CR>
  map <leader>a<SPACE> :Tabularize chunks<CR>
endif


""" vimwiki
let g:vimwiki_ext2syntax = {}


""" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=2

"" ranger
fun! RangerChooser()
  try
    silent !ranger --choosefile=/tmp/chosenfile `[ -z '%' ] && echo -n . || dirname %`
  catch
    silent !ranger --choosefile=/tmp/chosenfile .
  endtry
  if filereadable('/tmp/chosenfile')
    exec 'edit ' . system('cat /tmp/chosenfile')
    call system('rm /tmp/chosenfile')
  endif
  redraw!
endfun
map <Leader>r :call RangerChooser()<CR>

""" neco-ghc
" show detailed type info (slower).
let g:necoghc_enable_detailed_browse = 1

""" haskellmode
" use ghc functionality for haskell files
" au Bufenter *.hs compiler ghc

""" haskell
au FileType haskell nnoremap <buffer> <leader>t :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <leader>i :HdevtoolsInfo<CR>
" au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" don't include mapping from haskell.vim
let g:Haskell_no_mapping = 1

""" haskell-indent
let g:haskell_indent_if = 2
let g:haskell_indent_case = 4
