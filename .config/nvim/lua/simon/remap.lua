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

vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights", noremap = true, silent = true })

vim.keymap.set("n", "<leader>cx", vim.cmd.cclose, { desc = "Close quickfix" })
vim.keymap.set("n", "<leader>lx", vim.cmd.lclose, { desc = "Close location list" })

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to system clipboard" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

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

    local builtin = require('telescope.builtin')

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts, { desc = "[G]o to [D]eclaration" })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts, { desc = "[G]o to [D]efinition" })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts, { desc = "Show hover" })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts, { desc = "[G]o to [I]mplementation" })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts, { desc = "Show signature help" })
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts, { desc = "Go to type [D]efinition" })
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts, { desc = "LSP rename" })
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts, { desc = "LSP [C]ode [A]ction" })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts, { desc = "References" })
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts, { desc = "LSP format" })

    vim.keymap.set('n', '<leader>ws', function()
      builtin.lsp_dynamic_workspace_symbols({ symbols = { 'Class', 'Struct' } })
    end, { desc = '[W]orkspace [S]ymbols' })


    -- Not working with sourcekit :(
    -- local client = vim.lsp.get_client_by_id(ev.data.client_id)
    -- if client and client.server_capabilities.documentHighlightProvider then
    --   vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    --     buffer = ev.buf,
    --     callback = function()
    --       vim.lsp.buf.document_highlight()
    --     end,
    --   })

    --   vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    --     buffer = ev.buf,
    --     callback = function()
    --       vim.lsp.buf.clear_references()
    --     end,
    --   })
    -- end
  end,
})
