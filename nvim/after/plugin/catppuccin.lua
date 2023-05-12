-- local colors = require("catppuccin.palettes").get_palette()
--
-- require("catppuccin").setup({
-- 	transparent_background = true,
-- 	term_colors = true,
-- 	integrations = {
-- 		treesitter = true,
-- 		cmp = true,
-- 		illuminate = true,
-- 		harpoon = true,
-- 		gitsigns = true,
-- 		telescope = true,
-- 		nvimtree = true,
-- 		mason = true,
-- 		native_lsp = {
-- 			enabled = true,
-- 			virtual_text = {
-- 				errors = { "italic" },
-- 				hints = { "italic" },
-- 				warnings = { "italic" },
-- 				information = { "italic" },
-- 			},
-- 			underlines = {
-- 				errors = { "undercurl" },
-- 				hints = { "undercurl" },
-- 				warnings = { "undercurl" },
-- 				information = { "undercurl" },
-- 			},
-- 		},
-- 		dap = {
-- 			enabled = true,
-- 			enable_ui = true,
-- 		},
-- 		indent_blankline = {
-- 			enabled = true,
-- 			colored_indent_levels = false,
-- 		},
-- 	},
-- 	compile = {
-- 		enabled = true,
-- 		path = vim.fn.stdpath "cache" .. "/catppuccin"
-- 	},
-- })

-- highlight cursorline
vim.wo.cursorline = true
vim.opt.cursorlineopt = "number"
