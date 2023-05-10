" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
	
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'moll/vim-node'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-unimpaired'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'rust-lang/rust.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'pwntester/octo.nvim'
Plug 'github/copilot.vim'

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
call plug#end()

let g:coq_settings = { 'auto_start': 'shut-up' }

" Colors
color dracula
set bg=dark
set termguicolors

" Enable spellcheck in markdown files
augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

" Enable line numbers
set number

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

" Octo mappings
" list all open PR's
map <leader>p :Octo pr list<CR>

" Start review
map <leader>rst :Octo review start<CR>
"Resume review
map <leader>rre :Octo review resume<CR>
" Submit review
map <leader>rsu :Octo review submit<CR>
" List all pending comments in review
map <leader>rcls :Octo review comments<CR>

" Resolve thread
map <leader>tr :Octo thread resolve<CR>

imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

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


-- "# Mappings
-- " Copy and pasted from https://github.com/neovim/nvim-lspconfig
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
require('lspconfig')["sourcekit"].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')["tsserver"].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

--vim.diagnostic.config({virtual_text = false})

require'octo'.setup()

require'nvim-treesitter.configs'.setup {
	ensure_installed = { "swift", "json", "javascript", "rust" },
	auto_install = true
}
END
