" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" vim +PluginInstall +qall

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Lokaltog/vim-distinguished'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set nosmartindent
set ts=4

set hlsearch
:syntax on

set t_Co=256
:colorscheme distinguished

set foldmethod=indent

set guifont=Terminus\ 10

if has("autocmd")
	autocmd FileType python setlocal expandtab tw=79 ts=4 shiftwidth=4
	autocmd FileType lua setlocal expandtab tw=79 ts=2 shiftwidth=2
	autocmd FileType tex setlocal expandtab tw=79 ts=2 shiftwidth=2 spell
	autocmd FileType sql setlocal expandtab tw=80 ts=4 shiftwidth=4 spell
	autocmd FileType gitcommit setlocal tw=72 spell
	autocmd FileType context setlocal tw=72
endif

let NERDTreeIgnore = ['\.pyc$', 'tags', 'cscope.files', 'cscope.out', '\.patch']
" Total terminal witdh must be 120 cols to maintain 80 col width for files
let g:NERDTreeWinSize = 39

" airline
"set noshowmode
set laststatus=2
