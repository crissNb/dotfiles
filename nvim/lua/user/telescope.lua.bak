local ok, telescope = pcall(require, "telescope")
if not ok then
    return
end

local find_command = function()
    if 1 == vim.fn.executable 'fd' then
        return 'fd'
    elseif 1 == vim.fn.executable 'fdfind' then
    return 'fdfind'
        else
    return 'find'
        end
end

local find = find_command()

require("telescope").setup({
	defaults = {
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
	},
    pickers = {
        find_files = {
            find_command = {
                find, '--type', 'file', '--type', 'symlink', '--strip-cwd-prefix',
                '--unrestricted', '--exclude', '.git', '--ignore-file', '.ignore',
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    }
})

-- load telescope extensions
require('telescope').load_extension('fzf')
require('telescope').load_extension('project')

local M = {}

M.search_unity_scripts = function()
	require("telescope.builtin").find_files({
		prompt_title = "Unity Scripts",
		cwd = "Assets/Scripts",
		hidden = false,
	})
end

return M
