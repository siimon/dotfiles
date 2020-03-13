call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'moll/vim-node'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-unimpaired'
Plug 'benmills/vimux'
Plug 'flazz/vim-colorschemes'
call plug#end()

set shiftwidth=2
set tabstop=2

"set cindent

" use tabs
set softtabstop=2

" use spaces
set autoindent
set expandtab
"set smarttab

let base16colorspace=256
let g:solarized_termcolors=256
let g:solarized_diffmode="high"

set background=dark
color kkruby

set ignorecase
"set laststatus=2

set encoding=utf-8
set fileencoding=utf-8

set backspace=indent,eol,start

" Syntax Highlighting on
set nocompatible
syntax on
syntax enable
filetype on

" Remove background color for sign column (git status etc)
highlight clear SignColumn

" Disable bell.
set vb t_vb=

" line numbers
set number
set numberwidth=3

" Open new vertical split windows to the right
set splitright

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" don't wrap lines that are too long
set nowrap

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" use , as leader key
let mapleader = ","


map <leader>f :Files<CR>
nmap <leader>m :Marks<CR>
nmap <leader>b :Buffer<CR>

map <leader>tu :Make test-unit<CR>
map <leader>ts :Make test-system<CR>
map <leader>ta :Make test<CR>

map <leader>s :b#<CR>:SignifyRefresh<CR>
map <leader>d :Vexplore<CR>

map <leader>gs :Gst<CR>
map <leader>r :VimuxPromptCommand<CR>
map <leader>rr :VimuxRunLastCommand<CR>

" ignore node_modules directory
set wildignore =*/node_modules/*
set wildignore =*/dist/*
set wildignore =*/bower_components/*

set nobackup
set noswapfile

" highlight search results
set hlsearch

" clear highlighted matches with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" remap enter/shift-enter to insert blank lines
map <S-Enter> O<Esc>
map <CR> o<Esc>

" map leader-a to open a horizontal split of the alternate file
map <leader>a :split #<CR>

" Maps for jj to act as Esc
ino jj <esc>
cno jj <c-c>

" allow switching away from buffers that have changes
set hidden

set spelllang=en_us

" previewheight, used by GStatus
set previewheight=25

" AutoFormat JSON
function! FormatJSON() 
	set filetype=json
	:%!python -m json.tool
endfunction

nmap <leader>q :execute FormatJSON()<CR>

" Use CTRL hjkl to navigate windows
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-l> <C-w>l

let g:syntastic_javascript_checkers = ['eslint']

" Open loc list if errors exist
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0

" Setup fzf
set rtp+=/usr/local/opt/fzf
