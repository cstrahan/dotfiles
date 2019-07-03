let g:solarized_termcolors=256
let g:indentLine_color_term = 239
let g:indentLine_color_gui  = '#A4E57E'

set guicursor=
set guicursor+=n-v-c-sm:block-blinkon1
set guicursor+=i-ci-ve:ver25
set guicursor+=r-cr-o:hor20

" true-color support
if has("termguicolors")
  set termguicolors

  " need to provide the right escapes for tmux
  if has("termguicolors") && (&term =~ "screen" || &term =~ "screen-256color")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
endif

" scheme
colorscheme nord

" set terminal title
set title
autocmd BufEnter * let &titlestring = 'vim (' . expand("%:t") . ')'
if &term == "screen" || &term =~ "screen-256color"
  set t_ts=k
  set t_fs=\
endif

" font
if has("gui_macvim") || has("gui_win32")
  set guifont=PragmataPro:h10
elseif has("gui_gtk")
  set guifont=PragmataPro\ 10
end
"
if has('mouse')
  set mouse=a
  if has("mouse_sgr") && (&term =~ "xterm-termite" || &term =~ "screen" || &term =~ "screen-256color")
    " fixes selecting text beyond the 223rd column.
    set ttymouse=sgr
  endif
endif

if has("unix") && (!has("gui_running"))
  " Fix the ABCD problem when in insert mode
  imap 0A <ESC>ki
  imap 0B <ESC>ji
  imap 0C <ESC>li
  imap 0D <ESC>hi
end
