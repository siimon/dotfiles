" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
	
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'moll/vim-node'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-unimpaired'
Plug 'benmills/vimux'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'rust-lang/rust.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
call plug#end()

" Enable line numbers
set number

nnoremap <silent> <buffer> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <buffer> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <buffer> <leader>e <cmd>lua vim.diagnostic.open_float()<CR>

"# Mappings

" use , as leader key
let mapleader = ","
" use leader-s to change to alternate buffer
map <leader>s :b#<CR>
" clear highlighted matches with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Files in fzf
map <leader>f :Files<CR>
" History in fzf
map <leader>h :History<CR>
" Show fugitive git status
map <leader>gs :Git<CR>

"# Colors not set in colorscheme

" Remove the background color of the sign column
hi SignColumn ctermbg=NONE
" Matching paren is not readable enough, set background color to purple (=141)
hi MatchParen cterm=none ctermbg=141 ctermfg=253 

hi PMenu ctermbg=61
hi DiffAdd ctermbg=238
hi DiffChange ctermbg=238
hi DiffDelete ctermbg=238
hi DiffText ctermbg=234

lua << END
require('lualine').setup {
	options = { 
		icons_enabled = false,
		theme = 'dracula'
	},
	sections = {
		lualine_b = {'branch', 'diff'},
	}
}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.sourcekit.setup{}
require'lspconfig'.tsserver.setup{}


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   -- Disable underline in diagnostics
   underline = false
	 }
)

vim.diagnostic.config({virtual_text = false})
END
