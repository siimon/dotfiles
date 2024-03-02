vim.g.mapleader = ","

-- Set <leader>pv to enter netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down, center viewport" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up, center viewport" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to next search match, center viewport" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to previous search match, center viewport" })

vim.keymap.set("n", "<leader><leader>", ":nohlsearch<CR>", { desc = "Clear search highlights", noremap = true, silent = true })

vim.keymap.set("n", "<leader>qc", vim.cmd.cclose, { desc = "Close quickfix" })
vim.keymap.set("n", "<leader>lc", vim.cmd.lclose, { desc = "Close location list" })

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to system clipboard" })

-- LSP
--
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "Set location list" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'


    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts, { desc = "Go to declaration" })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts, { desc = "Go to definition" })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts, { desc = "Show hover" })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts, { desc = "Go to implementation" })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts, { desc = "Show signature help" })
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts, { desc = "Go to type definition" })
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts, { desc = "LSP rename" })
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts, { desc = "LSP code action" })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts, { desc = "References" })
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts, { desc = "LSP format" })
  end,
})
