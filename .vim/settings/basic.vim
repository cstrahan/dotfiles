"""
" vim settings organized by section, just like the docs
" :options for more information
"""

" consider tpope/vim-sensible, langnoremap

""" important

set nocompatible " vim, not vi

""" moving around, searching and patterns

set incsearch  " incremental searching
set ignorecase " searches are case insensitive...
set smartcase  " unless they contain a capital letter

""" displaying text

set scrolloff=3     " show at least 3 lines above/below cursor
set sidescrolloff=5 " and at least 5 columns next to cursor
set sidescroll=1    " and one to the left or right
set display+=lastline

set nowrap " don't wrap lines

set list " show invisible characters
set listchars=tab:>-,trail:⋅,nbsp:⋅,extends:»,precedes:«
"set showbreak=↪

set number " show line numbers

""" syntax, highlighting, and spelling

set background=dark

syntax enable " turn on syntax highlighting, allow overrides

set hlsearch " highlight matches

"set cursorline " show screen line for cursor
"set cursorcolumn " show screen line for cursor

set colorcolumn=+0,120 " show line at textwidth and 120 chars
set formatoptions-=t   " No auto-wrapping by default
set formatoptions+=j " Delete comment character when joining commented lines

" search upward for tags
setglobal tags-=./tags tags-=./tags; tags^=./tags;

""" multiple windows

set laststatus=2 " always show a status line

""" set statusline= " set in statusline.vim

set winheight=10   " current window always has a nice size
set winminheight=3 " but the other windows aren't *too* small

set hidden " hide buffers when not displayed (vs. unloading them)

set splitbelow " open new splits to the bottom
set splitright " and to the right

""" messages and info

set showcmd " show the current command as it's typed

set ruler " show ruler in lower right

set visualbell t_vb= " visual bell, but disabled (no beeping!)

""" editing text

set textwidth=80 " a reasonable default, no?

set backspace=indent,eol,start " backspace through everything in insert mode

set nojoinspaces " disable two-space joins


""" set shortmess options.

" Do not display "Pattern not found" messages during YouCompleteMe completion
" Patch: https://groups.google.com/forum/#!topic/vim_dev/WeBBjkXE8H8
try
  set shortmess+=c
catch /E539: Illegal character/
endtry

""" tabs and indenting

set tabstop=2    " two-space tabs
set shiftwidth=2 " autoindent is two spaces
set expandtab    " use spaces, not tabs
set smarttab

" disabling octal allows for incrementing numbers with leading 0s
set nrformats-=octal

""" reading and writing files

set autoread " auto-reload any file modified outside vim
if has("win32") || has("win64")
  set backupdir+=$TMP
else
  if exists("mkdir")
    call mkdir("~/tmp")
  end
  set backupdir=~/tmp//,/var/tmp//,/tmp//,.
endif

""" the swap file

set noswapfile " livin' on the edge
"if has("win32") || has("win64")
"  set directory+=$TMP
"else
"  if exists("mkdir")
"    call mkdir("~/tmp")
"  end
"  set directory=~/tmp//,/var/tmp//,/tmp//,.
"endif

""" command line editing

set history=1000 " store lots of :cmdline history, defaults to 20
set tabpagemax=50

" what files to ignore when doing filename completion, etc.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=vendor/gems/*,vendor/cache/*,.bundle/*,.sass-cache/*
" Disable temp and backup files
set wildignore+=*.swp,*~,._*

set wildmenu " command-line completion shows matches

set undofile " use an undo file when editing
set undodir=~/.vimundo
set undolevels=1000
set undoreload=10000

""" multi-byte characters

set encoding=utf-8 " set default encoding (default in macvim)
