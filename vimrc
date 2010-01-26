set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set background=dark
set nocompatible
set showmatch
set mouse=a
set term=xterm-256color
set hlsearch
set incsearch

syntax on
let g:zenburn_high_Contrast=1
colors zenburn

filetype plugin indent on
au FileType make setlocal noexpandtab
au FileType ruby setlocal softtabstop=2 shiftwidth=2

