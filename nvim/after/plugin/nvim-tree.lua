local status, nt = pcall(require, "nvim-tree")
if (not status) then
	return
end

nt.setup {
	filters = {
		custom = { ".git" },
		exclude = { "*.meta" },
	},
	renderer = {
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = ">",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true
	}
}
