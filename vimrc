" .vimrc
" Adam Greig
" https://github.com/adamgreig/dotvim

" vim is not vi
set nocompatible

" use a more compatible shell
if $SHELL =~ "fish"
    set shell=/bin/sh
endif

" use a thin cursor on gnome-terminal
" experimental, will only work when editing locally
if has("autocmd")
  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

" load plugins via vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Utilities
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
Plugin 'scrooloose/nerdcommenter'
Plugin 'wincent/Command-T'
Plugin 'sjl/gundo.vim'
Plugin 'briandoll/change-inside-surroundings.vim'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/swap-parameters'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-expand-region'

" Language/Syntax Support
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'
Plugin 'vim-scripts/opencl.vim'
Plugin 'petRUShka/vim-pyopencl'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'rust-lang/rust.vim'
Plugin 'stephpy/vim-yaml'
Plugin 'sirtaj/vim-openscad'

" To consider:
"Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-fugitive'
"Plugin 'jamessan/vim-gnupg'
call vundle#end()
filetype plugin indent on

" tabs and indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent

" behaviour
set backspace=indent,eol,start
set mouse=a
set term=xterm-256color
set modelines=0
set textwidth=79
set directory=~/.vim/tmp
set lazyredraw

" folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" appearance
set encoding=utf-8
set termencoding=utf-8
set colorcolumn=80
set wildmenu
set wildignore=*.pyc
set title
set showcmd
set showmode
set visualbell
set nofoldenable
set ruler
set cursorline

" searching
set hlsearch
set incsearch
set showmatch
set smartcase
set ignorecase

" colors
syntax enable
set background=dark
colorscheme solarized
highlight SignColumn ctermfg=12 ctermbg=0 guifg=Cyan guibg=Grey
highlight Error term=bold cterm=bold ctermfg=1 ctermbg=0 guifg=White guibg=Red
highlight Todo term=bold cterm=bold ctermfg=5 ctermbg=0 guifg=Blue guibg=Yellow

" key bindings
let mapleader=" "
map <silent> <leader><space> ;noh<CR>
" Highlight (line) to end of recently changed/yanked text
nnoremap <leader>v V`]
" Delete to _ register instead of default
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d
" Easier enter/leave paste mode
nmap <silent> <leader>o ;set paste<CR>
nmap <silent> <leader>O ;set nopaste<CR>
" Jump to end of anything pasted with 'p'
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" Quicker writes
nnoremap <leader>w :w<CR>
" Go to matching position with ', just line with `
nnoremap ' `
nnoremap ` '
" Use semicolon instead of colon to save shift key/fingers
noremap ; :
noremap : ;
" Don't show the stupid recent-commands window by accident
map q; ;q

" plugin key bindings
nnoremap <F5> :GundoToggle<CR>
"map <F2> :NERDTreeToggle<CR>
"map <F3> :call FindInNERDTree()<CR>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Unmap nerdcommenter's comment-invert, map instead change-inside-surroundings
nnoremap <leader>Ci <Plug>NERDCommenterInvert
nmap <script> <silent> <unique> <Leader>ci :ChangeInsideSurrounding<CR>

" filetype specific settings
autocmd FileType make setlocal noexpandtab
autocmd FileType ruby setlocal softtabstop=2 shiftwidth=2
autocmd FileType html setlocal softtabstop=2 shiftwidth=2
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufRead *.json set tw=0
autocmd BufNewFile,BufRead *.ebnf set filetype=ebnf
autocmd BufNewFile,BufRead *.cl set filetype=opencl
autocmd BufNewFile,BufRead *.sls set filetype=yaml
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=pandoc
augroup end

" supertab
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
highlight Pmenu ctermbg=238 gui=bold

" syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = "--max-complexity 11"
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_python_pylint_args = "-j8 -E"

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_highlighting = 1
let g:syntastic_enable_signs = 1

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "😞"
let g:syntastic_style_warning_symbol = "😕"

" pandoc
let g:pandoc_use_hard_wraps = 1
let g:pandoc#formatting#mode = 'ha'

" don't use rust.vim's default 99-char lines
let g:rust_recommended_style = 0

" always show a powerline
set laststatus=2
" disable the amazingly annoying delay reverting to command mode
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
