return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000,
	config = function()
		local color = "rose-pine"
		vim.cmd.colorscheme(color)
		vim.opt.termguicolors = true
	end
}
-- return { }
