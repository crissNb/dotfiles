local status, nt = pcall(require, "nvim-tree")
if (not status) then
    return
end

nt.setup {
    filters = {
        custom = { ".git", "*.meta", ".DS_Store" },
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
        update_root = true,
        ignore_list = {},
    },
    git = {
        enable = true
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
}
