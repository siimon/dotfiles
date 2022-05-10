let g:ale_disable_lsp = 1

call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
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
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
call plug#end()

nmap <silent> gd <Plug>(coc-definition)

let g:netrw_altv=1

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

" Following highlight clears might not be needed for some colorschemes and it
" might even break some.
" Remove background color for sign column (git status etc)
highlight clear SignifySignAdd
highlight clear SignifySignDelete

" Remove background color when showing folded text (like Gdiff)
highlight clear Folded

" No background color when changing stuff
highlight clear DiffChange
highlight clear DiffAdd
highlight clear DiffDelete

" Remove background color in the SignColumn (left most column)
highlight clear SignColumn

hi FgCocHintFloatBgCocFloating ctermfg=0

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
" and ,, as local leader
let maplocalleader = ",,"

map <leader>f :Files<CR>
nmap <leader>m :Marks<CR>
nmap <leader>b :Buffer<CR>

map <leader>tu :Make test-unit<CR>
map <leader>ts :Make test-system<CR>
map <leader>ta :Make test<CR>

map <leader>s :b#<CR>:SignifyRefresh<CR>

map <leader>gs :Git<CR>
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

let g:NetrwIsOpen=0
let g:netrw_winsize = 30
let g:netrw_banner = 0

" https://stackoverflow.com/questions/36363878/open-file-in-vertical-split-in-vim-netrw
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Toggle netrw on leader-d
noremap <silent> <leader>d :call ToggleNetrw()<CR>

" Undo hunk Shift+X
nmap <S-X> :SignifyHunkUndo<CR>

" Confirm coc completion on <CR>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Make <CR> select the first coc completion if prompt is visible
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Navigate coc completion list with <Tab> and <S-Tab>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
