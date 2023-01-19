vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup()
vim.cmd [[colorscheme catppuccin]]
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.g.gruvbox_material_transparent_background = 1
-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_background = "medium"
-- vim.g.gruvbox_material_foreground = "medium"
-- vim.g.gruvbox_material_enable_italic = 1
-- vim.cmd([[colorscheme gruvbox-material]])

require'colorizer'.setup()

vim.cmd([[
	:hi DiagnosticUnderlineError gui=undercurl
	:hi DiagnosticUnderlineWarn gui=undercurl
	:hi DiagnosticUnderlineInfo gui=undercurl
	:hi DiagnosticUnderlineHint gui=undercurl
]])
