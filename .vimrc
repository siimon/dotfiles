call pathogen#infect()

set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
let g:solarized_termcolors=256
color Tomorrow-Night
set columns=120
set lines=100
set ignorecase

if has("win32")
  cd C:\Users\SIMON
endif

if has("unix")
  let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
endif

" Exit vim if NERDTree is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <F2> :NERDTreeToggle<CR>
" open Nerd Tree in folder of file in active buffer
map <F3> :NERDTree %:p:h<CR>

" Enable filetype-specific indenting and plugins
filetype plugin indent on

" Syntax Highlighting on
set nocompatible
syntax on

" Disable bell.
set vb t_vb=

" line numbers
set number
set numberwidth=3

" Open new horizontal split windows below current
set splitbelow

" Open new vertical split windows to the right
set splitright

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" don't wrap lines that are too long
set nowrap

" Intelligent tab completion
inoremap <silent> <Tab> <C-r>=<SID>InsertTabWrapper(1)<CR>
inoremap <silent> <S-Tab> <C-r>=<SID>InsertTabWrapper(-1)<CR>
function! <SID>InsertTabWrapper(direction)
  let idx = col('.') - 1
  let str = getline('.')
  if a:direction > 0 && idx >= 2 && str[idx - 1] == ' '
        \&& str[idx - 2] =~? '[a-z]'
    if &softtabstop && idx % &softtabstop == 0
      return "\<BS>\<Tab>\<Tab>"
    else
      return "\<BS>\<Tab>"
    endif
  elseif idx == 0 || str[idx - 1] !~? '[a-z]'
    return "\<Tab>"
  elseif a:direction > 0
    return "\<C-p>"
  else
    return "\<C-n>"
  endif
endfunction

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead *.json :set ft=javascript

" leader is set to the dash key, as it is much friendlier on a swedish
" keyboard
let mapleader = "-"

set nobackup
set noswapfile

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" highlight search results
set hlsearch

" clear highlighted matches with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" remap enter/shift-enter to insert blank lines
map <S-Enter> O<Esc>
map <CR> o<Esc>

" map leader-a to open a vertical split of the alternate file
map <leader>a :AV<CR>

" Maps for jj to act as Esc
ino jj <esc>
cno jj <c-c>

" Replace current line with buffer contents via ctrl-p
nmap <C-p> "_ddP
vmap <C-p> "_dP

" Paste into a new line above or below
map å o<C-R>"<Esc>
map Å O<C-R>"<Esc>

" allow switching away from buffers that have changes
set hidden

let g:django_projects = '~/code'
let g:django_activate_virtualenv = 1
