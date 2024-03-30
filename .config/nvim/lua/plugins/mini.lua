return {
	'echasnovski/mini.nvim',
	config = function()
		require('mini.splitjoin').setup()
		require('mini.surround').setup()
	end
}
