" :so $MYVIMRC # Reload vimrc
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" vim +PluginInstall +qall
" vim +PluginUpdate +qall

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/tagbar'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'skywind3000/gutentags_plus'
"Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'dense-analysis/ale'
Plugin 'JuliaEditorSupport/julia-vim'
"Plugin 'ycm-core/YouCompleteMe'

Plugin 'jphustman/SQLUtilities'

"Plugin 'xavierd/clang_complete'
"Plugin 'gu-fan/riv.vim'

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
set t_Co=256

:syntax on
set background=dark
:colorscheme solarized
let g:solarized_termcolors=256

set inde=
set noai
set foldmethod=indent
set foldlevel=161 " A way to open all folds be default
set shiftwidth=4
set textwidth=79
let &colorcolumn=join(range(80,999),",")
set paste

hi SpellBad term=underline,bold cterm=underline,bold ctermfg=red gui=undercurl guisp=Red

let g:notes_unicode_enabled = 0
let g:notes_smart_quotes = 0

"set guifont=Droid\ Sans\ Mono\ Slashed\ 10
"set guifont=M+\ 1mn\ 10
set guifont=M\ PLUS\ 1\ Code\ 14

setlocal spell spelllang=en

if has("autocmd")
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	autocmd FileType cmake setlocal expandtab ts=4 shiftwidth=4 spell
	autocmd FileType context setlocal tw=72 spell
	autocmd FileType gitcommit setlocal tw=72 colorcolumn=72 spell
	autocmd FileType lua setlocal expandtab ts=2 shiftwidth=2
	autocmd FileType mail setlocal tw=72 colorcolumn=72 expandtab spell
	autocmd FileType notes setlocal expandtab spell
	autocmd FileType python setlocal expandtab ts=4 shiftwidth=4
	autocmd FileType r setlocal expandtab spell
	autocmd FileType rst setlocal expandtab spell
	autocmd FileType sgml setlocal expandtab spell
	autocmd FileType sql setlocal expandtab ts=4 shiftwidth=4 spell
	autocmd FileType tex setlocal expandtab ts=2 shiftwidth=2 spell
	autocmd FileType text setlocal expandtab spell
endif

let g:NERDTreeChDirMode = 2
let NERDTreeIgnore = ['\.pyc$', 'tags', 'cscope.files', 'cscope.out', 'cscope.in.out', 'cscope.po.out', '\.patch$', 'autom4te.cache', '\.BAK$', '\.o$', '\.log$', '\.so$', '_CPack_Packages', 'CMakeFiles', 'cmake_install.cmake', 'CMakeCache.txt', 'CPackConfig.cmake', 'install_manifest.txt', '\.war']
" Total terminal width must be 120 cols to maintain 80 col width for files
"let g:NERDTreeWinSize = 39

" Total terminal width must be 110 cols to maintain 80 col width for files
let g:NERDTreeWinSize=30
let g:NERDTreeDirArrows=0

" airline
"set noshowmode
" Move the laststatus line if using tabs in urxvt.
"set laststatus=2
"let g:airline_statusline_ontop=1
let g:airline_theme='solarized'

" ALE
let g:ale_virtualtext_cursor = 'disabled'

"let g:gutentags_trace=1
let g:gutentags_add_default_project_roots = 0
let g:gutentags_cache_dir = expand('~/.cache/tags')
let g:gutentags_ctags_exclude = [
      \ '*.git',
      \ 'build',
      \ 'CMakeFiles',
      \ ]
"let g:gutentags_ctags_executable="/usr/local/bin/ctags"
let g:gutentags_ctags_extra_args = [
      \ '--tag-relative=yes',
      \ '--fields=+ailmnS',
      \ ]
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_plus_switch = 1
let g:gutentags_project_root = ['.git']

"let g:ycm_clangd_binary_path="/usr/lib/llvm/10/bin/clangd"
"let g:clang_library_path="/usr/lib/llvm/10/lib64/"
