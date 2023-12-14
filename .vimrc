set nocompatible

filetype on
filetype plugin indent on
filetype indent on
set showcmd

if $TERM == "xterm-256color"
   set t_Co=256
endif

syntax on
set number
set ruler

set cursorline
set wildmenu
set lazyredraw
set showmatch

" Tab config
set tabstop=4
set textwidth=80
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab

" Search config
set incsearch
set hlsearch

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Move to beginning/end of the line
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>

" Matching braces and etc.
"inoremap { {<CR>}<Esc>ko
inoremap { {}<Esc>i
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap /* /*  */<Esc>hh

" Leader shortcuts
nnoremap <SPACE> <Nop>
let mapleader="\<SPACE>"        "Leader is comma
inoremap jk <esc>

set laststatus=2
set ttimeoutlen=50

" BUFFER CONFIG
nmap <leader>l :bnext<CR>
nmap <leader>h :bprev<CR>

" VIM AESTHETIC
hi LineNr ctermfg=black
hi CursorLineNR ctermfg=white
hi VertSplit cterm=bold ctermfg=white

" SOME MORE REMAPS 
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" HTML CONFIG
autocmd FileType html setlocal shiftwidth=2 tabstop=2
