let g:CSApprox_verbose_level=0

let mapleader = ","


" Default dirs
if has("win32") || has("win64")
  set directory=$TMP
  source ~/vimfiles/vimrc
else
  set directory=~/tmp
  source ~/.vim/vimrc
end


" Aesthetics
if has("gui_running")
  set guifont=PragmataPro:h10
  set background=dark
  colorscheme solarized
  call togglebg#map("<F5>")
endif

set linespace=0


" File types
autocmd FileType cs setlocal expandtab shiftwidth=4 softtabstop=4


" <leader>s to substitute word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Haskell stuffs
let g:haskell_indent_if   = 0
let g:haskell_indent_case = 5

if has('win32') || has("win64")
  let g:haddock_browser = 'cmd.exe /c start ""'
  let g:haddock_browser_callformat = '%s %s'
else
  let g:haddock_browser = 'open'
  let g:haddock_browser_callformat = '%s %s'
endif
