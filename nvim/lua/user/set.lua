-- neovim optimizations
require("impatient")

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.ignorecase = true

vim.opt.updatetime=50

vim.opt.termguicolors = true
vim.opt.cmdheight = 1

-- Use system clipboard by default
vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.foldmethod = "expr"

-- mouse support
vim.api.nvim_set_option("mouse", "a")
