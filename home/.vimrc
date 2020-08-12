source $VIMRUNTIME/defaults.vim

let mapleader = "\<Space>"

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" on pressing tab, insert 4 spaces
set expandtab

set nocompatible

set autoindent
set smartindent
set ignorecase
set smartcase
set smarttab
set relativenumber
set number
set showcmd
set tildeop
set noshowmode
syntax on

let g:elm_setup_keybindings = 0

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Zaptic/elm-vim'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'vim-syntastic/syntastic'
" Plug 'ycm-core/YouCompleteMe'
Plug 'justinmk/vim-sneak'

call plug#end()

set laststatus=2

let g:polyglot_disabled = ['elm']

if !has('gui_running')
    set t_Co=256
endif

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:elm_syntastic_show_warnings = 1

let g:ycm_semantic_triggers = {
    \ 'elm' : ['.'],
    \ }

" call neocomplete#util#set_default_dictionary(
    " \ 'g:neocomplete#sources#omni#input_patters',
    " \ 'elm',
    " \ '\.')
