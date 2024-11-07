return {
	"tpope/vim-dadbod",
	lazy = true,
	dependencies = {
		{ "kristijanhusak/vim-dadbod-ui", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", lazy = true }
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBFindBuffer",
	}
}
