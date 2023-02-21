" .vimrc
" Adam Greig
" https://github.com/adamgreig/dotvim

" vim is not vi
set nocompatible

" use a more compatible shell
if $SHELL =~ "fish"
    set shell=/bin/sh
endif

" load plugins via vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

" Utilities
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'sjl/gundo.vim'
Plugin 'briandoll/change-inside-surroundings.vim'
Plugin 'morhetz/gruvbox'
Plugin 'terryma/vim-expand-region'
Plugin 'triglav/vim-visual-increment'
Plugin 'junegunn/vim-easy-align'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'dense-analysis/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'sjl/tslime.vim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
"Plugin 'neoclide/coc.nvim', {'branch': 'release'}
"Plugin 'embear/vim-localvimrc'

" Language/Syntax Support
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'
Plugin 'vim-scripts/opencl.vim'
Plugin 'petRUShka/vim-pyopencl'
"Plugin 'vim-pandoc/vim-pandoc-syntax'
"Plugin 'vim-pandoc/vim-pandoc'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'rust-lang/rust.vim'
Plugin 'stephpy/vim-yaml'
Plugin 'sirtaj/vim-openscad'
"Plugin 'fatih/vim-go'
Plugin 'ARM9/arm-syntax-vim'
Plugin 'ervandew/supertab'
Plugin 'psf/black'
Plugin 'cespare/vim-toml'

" To consider:
"Plugin 'scrooloose/nerdtree'
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
set ttymouse=sgr
set term=xterm-256color
set modelines=0
set textwidth=79
set directory=~/.vim/tmp
set lazyredraw
"set spell " (spelling off by default)
set spelllang=en_gb
" fix background rendering in kitty
let &t_ut=''

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
set noshowmode
"set visualbell
set ruler
set cursorline
set listchars=tab:›\ ,trail:·
set list

" searching
set hlsearch
set incsearch
set showmatch
set smartcase
set ignorecase

" colors
syntax enable
set background=dark
let g:gruvbox_sign_column="bg0"
let g:gruvbox_vert_split="gray"
let g:gruvbox_color_column="bg1"
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=1
colorscheme gruvbox
highlight Error term=bold cterm=bold ctermfg=124 ctermbg=0 guifg=White guibg=Red
highlight Todo term=bold cterm=bold ctermfg=132 ctermbg=0 guifg=Blue guibg=Yellow
highlight SpellBad cterm=underline
highlight CursorLine ctermbg=235

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
" Quicker quits
nnoremap <leader>q :q<CR>
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
" fzf
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>e :GFiles<CR>
nnoremap <leader>r :Rg<CR>

command Black !black %:p
autocmd FileType python nnoremap <leader>f :Black<CR>

" Unmap nerdcommenter's comment-invert, map instead change-inside-surroundings
nnoremap <leader>Ci <Plug>NERDCommenterInvert
nmap <script> <silent> <unique> <Leader>ci :ChangeInsideSurrounding<CR>

" filetype specific settings
autocmd FileType make setlocal noexpandtab
autocmd FileType ruby setlocal softtabstop=2 shiftwidth=2
autocmd FileType html setlocal softtabstop=2 shiftwidth=2
autocmd FileType htmldjango setlocal softtabstop=2 shiftwidth=2
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType rust setlocal colorcolumn=100 textwidth=99
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufNewFile,BufRead *.json set tw=0
autocmd BufNewFile,BufRead *.ebnf set filetype=ebnf
autocmd BufNewFile,BufRead *.cl set filetype=opencl
autocmd BufNewFile,BufRead *.sls set filetype=yaml
autocmd BufNewFile,BufRead *.tex set tw=0
autocmd BufNewFile,BufRead *.s,*.S set filetype=arm
"augroup markdown
    "au!
    "au BufNewFile,BufRead *.md,*.markdown setlocal filetype=pandoc
"augroup end
hi link rustCommentLineDoc PreProc
autocmd FileType rust syn keyword rustUnsafeKeyword unsafe
autocmd FileType rust hi link rustUnsafeKeyword Special

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"let g:airline_detect_spell=1
let g:airline_detect_spelllang=0
"let g:airline_inactive_collapse=1
let g:airline_theme="bubblegum"

" ALE
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠️"
let g:ale_linters = {'rust': ['analyzer'], 'cpp': ['cc'], 'c': ['cc'], 'python': ['flake8'] }
let g:ale_cpp_cc_options = '-std=c++14 -Wall -I/usr/local/share/yosys/include'
let g:ale_c_cc_options = '-std=c99 -Wall -I/home/adam/opt/ti/ccs1120/ccs/ccs_base/msp430/include_gcc'
"let g:ale_completion_enabled = 1
let g:ale_rust_analyzer_config = {
    \ 'checkOnSave':    { 'allTargets': v:false },
\}

" Black
let g:black_virtualenv = "~/.vim/tmp/black"

" gitgutter
let g:gitgutter_realtime = 0

" use latex for plain .tex files
let g:tex_flavor='latex'

" tslime
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<leader>t'
let g:tslime_visual_mapping = '<leader>t'
let g:tslime_vars_mapping = '<leader>T'

" pandoc
let g:pandoc_use_hard_wraps = 1
let g:pandoc#formatting#mode = 'ha'
let g:vim_markdown_folding_disabled = 1

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-go
let g:go_fmt_autosave = 1

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
