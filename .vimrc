set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'benmills/vimux'
Plugin 'benmills/vimux-golang'
Plugin 'bling/vim-airline'
Plugin 'einars/js-beautify'
Plugin 'fatih/vim-go'
Plugin 'gagoar/StripWhiteSpaces'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kien/ctrlp.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/syntastic'
Plugin 'veegee/cql-vim'
Plugin 'vim-scripts/vimwiki'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/Zenburn'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'auto-pairs-gentle'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on

colorscheme ron

set t_Co=256
set wildmenu
set showcmd
set hlsearch
set nomodeline
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set number
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set shiftwidth=2
set softtabstop=2
set expandtab

map Y y$

nnoremap <C-L> :nohl<CR><C-L>

let g:AutoPairsUseInsertedCount=1
let g:go_version_warning=0

autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufWritePre *.js :call JsBeautify()
autocmd BufWritePre *.css :call CssBeautify()
autocmd BufWritePre *.html :call HtmlBeautify()
autocmd BufWritePre *.json :call JsonBeautify()
imap jk <esc>
