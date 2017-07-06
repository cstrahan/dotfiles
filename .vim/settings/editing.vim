" basic editing
let mapleader = ','
let maplocalleader = ','

" Unite
if executable('ag')
  " include ignored and hidden files
  let g:unite_source_rec_async_command= 'ag --nocolor --nogroup --hidden -g ""'
endif
let g:unite_enable_start_insert = 1
let g:unite_winheight = 10
let g:unite_split_rule = 'botright'
let g:unite_enable_use_short_source_names = 1
let g:unite_marked_icon = '=>'
let g:unite_no_default_keymappings = 1
" let g:unite_source_history_yank_enable = 1
" let g:unite_source_history_yank_limit  = 1024
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
" nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
" nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
" nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
" 
" " Custom mappings for the unite buffer
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
"   " Play nice with supertab
"   let b:SuperTabDisabled=1
"   " Enable navigation with control-j and control-k in insert mode
"   imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"   imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
" endfunction

" strangely, even if the C-s/C-q flow-control bindings
" appear to be disabled, the C-s sequence will only make it
" to Vim iff IXON has been disabled with `stty -ixon`.
noremap  <silent> <C-S>    :update<CR>
vnoremap <silent> <C-S>    <C-C>:update<CR>
inoremap <silent> <C-S>    <C-O>:update<CR>

" show commands
command! -nargs=0 ShowMaps silent call viewmaps#Show()
command! -nargs=0 ShowMapsVerbose silent call viewmaps#ShowVerbose()

" enable plugin filetypes and indentation
filetype plugin indent on

" haskell re-formatting
" cabal install stylish-haskell
" default settings:
"   stylish-haskell --defaults > ~/.stylish-haskell.yaml
command! -nargs=0 HaskellFormat silent %!stylish-haskell

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
" nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" replacement for netrw's gx mapping
if !maparg("gx", "n")!=""
  nmap gx :call url#OpenUrlUnderCursor()<CR>
endif 

" Insert lambda with <C-l>
inoremap <silent> <C-l> <C-k>l*

" like gm, but go to center of text, not screen line
map <silent> gM :exe 'normal '.(virtcol('$')/2).'\|'<CR>

" create the directory of the current buffer via `mkdir -p`
map <leader>md :!mkdir -p %:p:h<CR>

" move quickly between splits
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" better movement bindings in command mode
"set timeout timeoutlen=1000 ttimeoutlen=100
"set <M-h>=h
"set <M-l>=l
"set <M-H>=H
"set <M-L>=L
"cnoremap <M-h> <Left>
"cnoremap <M-l> <Right>
"cnoremap <M-H> <S-Left>
"cnoremap <M-L> <S-Right>

" fast zoom for a split
map <C-_> <C-w>_

" get the last pasted text (via evilchelu)
nnoremap gb '[V']

" strip leading tabs and trailing whitespace
command Tr %s/\s\+$//ge | %s/\t/  /ge | nohlsearch

" substitute word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" replace the selected text
vnoremap <C-r> "hy:%s/\V<C-r>=escape(@h,'/')<CR>//gc<left><left><left>

" search for the selected text in the current file
" this is useful for more complex strings than #/* can search
vnoremap <C-f> "hy:/\V<C-r>=escape(@h,'/')<CR>/<CR>

" easy command
map <Space> :

" easy tabs
map <leader>tn :tabnew<CR>

" easy escape
imap jj <Esc>
imap kk <Esc>

" Map Control-# to switch tabs
"map  <C-0> 0gt
"imap <C-0> <Esc>0gt
"map  <C-1> 1gt
"imap <C-1> <Esc>1gt
"map  <C-2> 2gt
"imap <C-2> <Esc>2gt
"map  <C-3> 3gt
"imap <C-3> <Esc>3gt
"map  <C-4> 4gt
"imap <C-4> <Esc>4gt
"map  <C-5> 5gt
"imap <C-5> <Esc>5gt
"map  <C-6> 6gt
"imap <C-6> <Esc>6gt
"map  <C-7> 7gt
"imap <C-7> <Esc>7gt
"map  <C-8> 8gt
"imap <C-8> <Esc>8gt
"map  <C-9> 9gt
"imap <C-9> <Esc>9gt

" tab movement

map <Leader>m gT
map <Leader>. gt

" from http://coderwall.com/p/zfqmiw
" Fake '|' as text object
nnoremap di\| T\|d,
nnoremap da\| F\|d,
nnoremap ci\| T\|c,
nnoremap ca\| F\|c,
nnoremap yi\| T\|y,
nnoremap ya\| F\|y,
nnoremap vi\| T\|v,
nnoremap va\| F\|v,

" Fake '/' as text object
nnoremap di/ T/d,
nnoremap da/ F/d,
nnoremap ci/ T/c,
nnoremap ca/ F/c,
nnoremap yi/ T/y,
nnoremap ya/ F/y,
nnoremap vi/ T/v,
nnoremap va/ F/v,
