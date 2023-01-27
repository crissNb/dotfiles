-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "

require("user.lazy")

require("user.set")
require("user.keymap")
require("user.lspconfig")

-- telescope
require("user.telescope")
