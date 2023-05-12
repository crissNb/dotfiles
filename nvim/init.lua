-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.cmd("let g:coq_settings = { 'auto_start': 'shut-up' }")

require("user.lazy")

require("user.set")
require("user.keymap")
require("user.lspconfig")

-- telescope
require("user.telescope")
