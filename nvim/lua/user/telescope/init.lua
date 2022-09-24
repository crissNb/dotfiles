local telescope = require("telescope")
local actions = require("telescope.actions")
local buffer_previewer = require("user.telescope.buffer_previewer")
local hologram = require("user.telescope.hologram")

buffer_previewer.teardown = hologram.teardown

telescope.setup({
	defaults = {
		prompt_prefix = "Find: ",

		layout_config = {
			horizontal = { mirror = false, preview_width = 0.5 },
		},

		buffer_previewer_maker = hologram.buffer_previewer_maker,

		mappings = {
			i = {
				["<M-j>"] = actions.move_selection_next,
				["<M-k>"] = actions.move_selection_previous,
				["<M-q>"] = actions.close,
			},
		},

		file_previewer = buffer_previewer.cat.new,
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
		},
	},

	pickers = {
		find_files = {
			find_command = {
				"fd",
				"--type",
				"f",
				"--strip-cwd-prefix",
				"--hidden",
				"--exclude",
				".git",
			},
		},
	},

	extensions = {
		aerial = {
			show_nesting = true,
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown {
			}
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case", -- this is default
		},
	},
})

telescope.load_extension("fzf") -- Better fuzzy search result
telescope.load_extension("ui-select") -- Use for lsp action
telescope.load_extension("aerial")
telescope.load_extension("find_template")
