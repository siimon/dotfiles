vim.opt.signcolumn = "yes"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.smartindent = true

vim.opt.lazyredraw = true
vim.opt.updatetime = 50

vim.opt.swapfile = false
vim.opt.splitright = true

vim.opt.cursorline = true

vim.opt.inccommand = "split"


vim.api.nvim_create_autocmd("FileType", {
  pattern = "swift",
  callback = function()
    vim.opt.commentstring = "// %s"
  end,
})

-- Flash yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})
