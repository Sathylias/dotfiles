set nocompatible
" set t_Co=256
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'tpope/vim-vinegar'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic'

call vundle#end()            

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
inoremap { {<CR>}<Esc>ko
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap /* /*  */<Esc>hh

" Leader shortcuts
nnoremap <SPACE> <Nop>
let mapleader="\<SPACE>"        "Leader is comma
inoremap jk <esc>

" VIM AIRLINE SETUP
set laststatus=2
set ttimeoutlen=50
let g:airline_theme='serene'
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '' 
let g:airline#extension#tabline#fnamemod = ':t'
autocmd FileType * unlet! g:airline#extensions#whitespace#checks

" BUFFER CONFIG
nmap <leader>l :bnext<CR>
nmap <leader>h :bprev<CR>

" NEEDED FOR CLANG COMPLETE
let g:clang_user_options='||exit 0'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1

" VIM AESTHETIC
hi LineNr ctermfg=black
hi CursorLineNR ctermfg=white
hi YcmErrorLine ctermbg=NONE ctermfg=NONE
hi YcmErrorSection ctermbg=DARKBLUE ctermfg=NONE
hi YcmErrorSign ctermbg=white ctermfg=black
hi VertSplit cterm=bold ctermfg=white

" SOME MORE REMAPS 
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" PYTHON CONFIG
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>


autocmd FileType html setlocal shiftwidth=2 tabstop=2
