return {
	"dracula/vim",
	name = "dracula",
	priority = 1000,
	config = function()
		local color = "dracula"
		vim.cmd.colorscheme(color)
		vim.opt.termguicolors = true
		vim.api.nvim_set_hl(0, "MatchParen", { link = "DraculaOrangeInverse" })
	end
}
