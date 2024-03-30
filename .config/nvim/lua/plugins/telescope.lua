return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {},
	config = function()
		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>sf', function()
			builtin.find_files { previewer = false }
		end,
		{ desc = "[S]earch [F]iles" })

		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elp tags" })
		vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = "[S]earch [C]ommands" })
		vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

		vim.keymap.set('n', '<leader>sb', builtin.git_branches, { desc = "[S]earch git [B]ranches" })
		vim.keymap.set('n', '<leader>st', builtin.treesitter, { desc = "[S]earch [T]reesitter" })
	end,
}

