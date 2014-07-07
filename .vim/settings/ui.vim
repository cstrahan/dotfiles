let g:solarized_termcolors=256
let g:indentLine_color_term = 239
let g:indentLine_color_gui  = '#A4E57E'

" scheme
colorscheme hybrid
 
" set terminal title
set t_ts=k
set t_fs=\
autocmd BufEnter * let &titlestring = 'vim (' . expand("%:t") . ')'
set title

" font
if has("gui_macvim") || has("gui_win32")
  set guifont=PragmataPro:h10
elseif has("gui_gtk")
  set guifont=PragmataPro\ 10
end

" https://wincent.com/blog/tweaking-command-t-and-vim-for-use-in-the-terminal-and-tmux
if has('mouse')
  set mouse=a
  if &term =~ "xterm" || &term =~ "screen"
    " for some reason, doing this directly with 'set ttymouse=xterm2'
    " doesn't work -- 'set ttymouse?' returns xterm2 but the mouse
    " makes tmux enter copy mode instead of selecting or scrolling
    " inside Vim -- but luckily, setting it up from within autocmds
    " works
    autocmd VimEnter * set ttymouse=xterm2
    autocmd FocusGained * set ttymouse=xterm2
    autocmd BufEnter * set ttymouse=xterm2
  endif
endif

if has("unix") && (!has("gui_running"))
  set ttymouse=xterm

  " Fix the ABCD problem when in insert mode
  imap 0A <ESC>ki
  imap 0B <ESC>ji
  imap 0C <ESC>li
  imap 0D <ESC>hi
end

" set custom cursor -- vertical bar in insert mode (iTerm2)
" from http://www.iterm2.com/#/section/documentation/escape_codes
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
