require("catppuccin").setup({
	transparent_background = false,
	term_colors = true,
	integrations = {
		treesitter = true,
		cmp = true,
		illuminate = true,
		harpoon = true,
		gitsigns = true,
		telescope = true,
		nvimtree = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		dap = {
			enabled = true,
			enable_ui = true,
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
	},
})

-- highlight cursorline
vim.wo.cursorline = true
vim.opt.cursorlineopt = "number"
