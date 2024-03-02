return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Fugitive: git status" })
    vim.keymap.set("n", "<leader>gl", "<cmd>Gclog origin/development..HEAD<cr>", { desc = "Fugitive: git log branch commits" })
    vim.keymap.set("n", "<leader>glp", "<cmd>Gclog @{push}..<cr>", { desc = "Fugitive: git log not pushed commits" })
	end
}
