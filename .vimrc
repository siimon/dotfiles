call pathogen#infect()
call pathogen#helptags()

set shiftwidth=2
set tabstop=2

" use tabs
set softtabstop=2

" use spaces
"set autoindent
"set expandtab
"set smarttab

let base16colorspace=256
let g:solarized_termcolors=256
let g:solarized_diffmode="high"

set background=dark
" theme is set by the zsh config instead
color base16-default

set ignorecase
set laststatus=2

if has("win32")
  cd C:\Users\SIMON
endif

set encoding=utf-8
set fileencoding=utf-8

set guifont=Menlo\ Regular:h12

if has("unix")
  let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
endif

" Exit vim if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" Syntax Highlighting on
set nocompatible

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

" use leader-f to open ctrlp
map <leader>f :CtrlP<CR>

map <leader>tu :Make test-unit<CR>
map <leader>ts :Make test-system<CR>
map <leader>ta :Make test<CR>

nmap <leader>g :CtrlPLine<CR>
nmap <leader>c :CtrlPChangeAll<CR>
nmap <leader>b :CtrlPBuffer<CR>

" lw to use selected word in ctrlp
nmap <leader>lw :CtrlP<CR><C-\>w
vmap <leader>lw y:CtrlP<CR><C-\>c

map <leader>s :b#<CR>
map <leader>d :NERDTreeToggle<CR>

" ignore node_modules directory
set wildignore+=*/node_modules/*
set wildignore+=*/dist/*
set wildignore+=*/bower_components/*


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

" Replace current line with buffer contents via ctrl-p
nmap <C-p> "_ddP
vmap <C-p> "_dP

" allow switching away from buffers that have changes
set hidden

set spelllang=en_us

" previewheight, used by GStatus
set previewheight=25

" vim-golang settings
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" AutoFormat JSON
function! FormatJSON() 
	set filetype=json
	:%!python -m json.tool
endfunction

nmap <leader>q :execute FormatJSON()<CR>

" Use CTRL+hjkl to navigate windows
nmap <C-h> <C-w>h
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-l> <C-w>l

" Open dash on selected word
nmap <silent> <leader>dd <Plug>DashSearch

let g:syntastic_javascript_checkers = ['eslint']

"
" " Open loc list if errors exist
let g:syntastic_auto_loc_list = 1
"
let g:syntastic_always_populate_loc_list = 1
"
" Dont auto insert closing brackets etc in clj files
let g:sexp_enable_insert_mode_mappings = 0

if exists(":Tabularize")
	nmap <Leader>w= :Tabularize /=<CR>
	vmap <Leader>w= :Tabularize /=<CR>
	nmap <Leader>w: :Tabularize /:\zs<CR>
	vmap <Leader>w: :Tabularize /:\zs<CR>
endif
