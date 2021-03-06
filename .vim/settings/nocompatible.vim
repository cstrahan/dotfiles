" http://skwp.github.com/dotfiles/
" https://github.com/aniero/vimfiles

""" basic settings first:
source $HOME/.vim/settings/basic.vim

" TODO: Use Merlin for OCaml completion.
" let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') ."/ocamlmerlin"

" Leave out TAB/S-TAB, and use C-P/C-N instead.
" This also prevents conflicting with UltiSnips.
" (UltiSnips uses TAB C-J/C-K)
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_semantic_triggers =  {
  \   'haskell' : ['.'],
  \   'purescript' : ['.'],
  \   'go' : ['.'],
  \ }

""" netrw
let g:NERDTreeHijackNetrw = 0 " Stop NERDTree from hijacking netrw
let g:loaded_netrw        = 1 " Disable netrw
let g:loaded_netrwPlugin  = 1 " Disable netrw
" au VimEnter * :NERDTreeToggle
" au VimEnter * :wincmd p

let g:go_fmt_fail_silently = 0 " When 1, prevents vim-go from popping-up quickfix window
let g:go_fmt_command = "goimports"
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": [] }

""" load plugin paths
call pathogen#infect("~/.nix-profile/vim-plugins/{}")

source $HOME/.vim/settings/ui.vim
source $HOME/.vim/settings/editing.vim
source $HOME/.vim/settings/plugins.vim
source $HOME/.vim/settings/autocommands.vim
