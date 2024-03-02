return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
    require('telescope').setup({
    })
    local builtin = require('telescope.builtin')

    -- Don't use previewer in file listing
		vim.keymap.set('n', '<leader>pf', "<cmd>lua require('telescope.builtin').find_files{ previewer = false }<CR>", { desc = "Find files" })

    vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end
    , { desc = "Grep word under cursor" })

		vim.keymap.set('n', '<leader>ps', function()
      builtin.live_grep()
		end,
    { desc = "Grep string" })

    vim.keymap.set('n', '<leader>o', function()
      builtin.lsp_workspace_symbols({ query = vim.fn.input("LSP Workspace Symbols > "), symbols = { "class", "struct" } })
    end, { desc = "LSP workspace symbols" })

    vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "Git branches" })
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "nvim help tags" })
    vim.keymap.set('n', '<leader>pt', builtin.treesitter, { desc = "Treesitter" })
	end,
}

