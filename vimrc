" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" vim +PluginInstall +qall

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Lokaltog/vim-distinguished'
"Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'vim-scripts/SQLUtilities'
Plugin 'jphustman/SQLUtilities'
Plugin 'vim-scripts/Align'

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

set enc=utf-8
set nosmartindent
set ts=4

set hlsearch
:syntax on

set t_Co=256
set background=dark
let g:solarized_termcolors=256
:colorscheme solarized

set inde=
set noai
set foldmethod=indent
set shiftwidth=4
set textwidth=79
let &colorcolumn=join(range(80,999),",")
set paste

let g:notes_unicode_enabled = 0
let g:notes_smart_quotes = 0

set guifont=M+\ 1mn\ Medium\ 10

if has("autocmd")
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	autocmd FileType context setlocal tw=72 spell
	autocmd FileType gitcommit setlocal tw=72 colorcolumn=72 spell
	autocmd FileType lua setlocal expandtab ts=2 shiftwidth=2
	autocmd FileType mail setlocal tw=72 colorcolumn=72 expandtab spell
	autocmd FileType notes setlocal expandtab spell
	autocmd FileType python setlocal expandtab ts=4 shiftwidth=4
	autocmd FileType r setlocal expandtab spell
	autocmd FileType sql setlocal expandtab ts=4 shiftwidth=4 spell
	autocmd FileType tex setlocal expandtab ts=2 shiftwidth=2 spell
	autocmd FileType text setlocal expandtab spell
endif

let NERDTreeIgnore = ['\.pyc$', 'tags', 'cscope.files', 'cscope.out', '\.patch$', 'autom4te.cache', '\.o$', '\.log$', '_CPack_Packages', 'CMakeFiles', 'cmake_install.cmake', 'CMakeCache.txt', 'CPackConfig.cmake', 'install_manifest.txt', '\.war']
" Total terminal witdh must be 120 cols to maintain 80 col width for files
"let g:NERDTreeWinSize = 39

" Total terminal witdh must be 110 cols to maintain 80 col width for files
let g:NERDTreeWinSize=26
let g:NERDTreeDirArrows=0

" airline
"set noshowmode
" Move the laststatus line if using tabs in urxvt.
"set laststatus=2
