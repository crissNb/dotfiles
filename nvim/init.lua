-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("user.set")
require("user.keymap")
require("user.lspconfig")

require("user.packer")

-- telescope
require("user.telescope")
