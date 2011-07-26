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
set mouse=a
set term=xterm-256color
set modelines=0
set encoding=utf-8
set nocompatible
set title
set visualbell
set nofoldenable

set hlsearch
set incsearch
set showmatch
set smartcase
set ignorecase
set showcmd
set ruler

set textwidth=79

set directory=~/.vim/tmp

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
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
highlight Pmenu ctermbg=238 gui=bold

nnoremap ' `
nnoremap ` '

runtime macros/matchit.vim

au BufNewFile,BufRead *.less set filetype=less
