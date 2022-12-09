require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,
		file_ignore_patterns = {
			".git/",
			"target/",
			"docs/",
			"vendor/*",
			"%.lock",
			"__pycache__/*",
			"%.sqlite3",
			"%.ipynb",
			"node_modules/*",
			-- "%.jpg",
			-- "%.jpeg",
			-- "%.png",
			"%.svg",
			"%.otf",
			"%.ttf",
			"%.webp",
			".dart_tool/",
			".github/",
			".gradle/",
			".idea/",
			".settings/",
			".vscode/",
			"__pycache__/",
			"build/",
			"env/",
			"gradle/",
			"node_modules/",
			"%.pdb",
			"%.dll",
			"%.class",
			"%.exe",
			"%.cache",
			"%.ico",
			"%.pdf",
			"%.dylib",
			"%.jar",
			"%.docx",
			"%.met",
			"smalljre_*/*",
			".vale/",
			"%.burp",
			"%.mp4",
			"%.mkv",
			"%.rar",
			"%.zip",
			"%.7z",
			"%.tar",
			"%.bz2",
			"%.epub",
			"%.flac",
			"%.tar.gz",
		},
	},
	mappings = {
		n = {
			["cd"] = function(prompt_bufnr)
				local selection = require("telescope.actions.state").get_selected_entry()
				local dir = vim.fn.fnamemodify(selection.path, ":p:h")
				require("telescope.actions").close(prompt_bufnr)
				vim.cmd(string.format("silent lcd %s", dir))
			end
		}
	}
})

-- load telescope extensions
require('telescope').load_extension('projects')

local M = {}

M.search_unity_scripts = function()
	require("telescope.builtin").find_files({
		prompt_title = "Unity Scripts",
		cwd = "Assets/Scripts",
		hidden = false,
	})
end

return M
