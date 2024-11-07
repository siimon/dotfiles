return {
	"sindrets/diffview.nvim",
	lazy = true,
	cmd = "DiffviewOpen",
	keys = {
		{ "<leader>do", "<cmd>DiffviewOpen<cr>", desc = "[D]iffview [O]pen" },
		{ "<leader>db", "<cmd>DiffviewOpen origin/development..HEAD<cr>", desc = "[D]iffview [B]ranch / development" },
		{ "<leader>df", "<cmd>DiffviewFileHistory %<cr>", desc = "[D]iffview [F]ile History" },
		{ "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "[D]iffview [C]lose" },
	},
}
