return {
	"dracula/vim",
	name = "dracula",
	priority = 1000,
	config = function()
		local color = "dracula"
		vim.cmd.colorscheme(color)
		vim.opt.termguicolors = true
	end
}
