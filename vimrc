filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

set background=dark
set nocompatible
set mouse=a
set term=xterm-256color

set hlsearch
set incsearch
set showmatch
set smartcase
set ignorecase

set showcmd
set ruler

set textwidth=79

syntax on
let g:zenburn_high_Contrast=1
colors zenburn

au FileType make setlocal noexpandtab
au FileType ruby setlocal softtabstop=2 shiftwidth=2

map <F2> :NERDTreeToggle<CR>
map <F3> :call FindInNERDTree()<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"inoremap <Left>  <NOP>
"inoremap <Right> <NOP>
"inoremap <Up>    <NOP>
"inoremap <Down>  <NOP>

au BufNewFile,BufRead *.less set filetype=less
