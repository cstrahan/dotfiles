let g:CSApprox_verbose_level=0

let mapleader = ","


if has("win32") || has("win64")
  set directory=$TMP
  source ~/vimfiles/vimrc
else
  set directory=~/tmp
  source ~/.vim/vimrc
end

if has("gui_win32") || has("gui_win32s")
  set guifont=PragmataPro:h10
  set background=dark
  colorscheme solarized
endif

" Taggle Solarized background
call togglebg#map("<F5>")

set linespace=0
