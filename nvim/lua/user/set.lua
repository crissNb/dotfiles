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

-- Use system clipboard by default
vim.api.nvim_set_option("clipboard", "unnamed")
vim.opt.foldmethod = "expr"

-- mouse support
vim.api.nvim_set_option("mouse", "a")
