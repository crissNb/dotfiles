local M = {}

M.nvimtree = {
    git = {
        enable = true,
    },
    renderer = {
        highlight_git = true,
        icons = {
            show = {
                git = true,
            },
        },
    },
    filters = {
        dotfiles = true,
        custom = {"*.meta"},
    },
}

M.mason = {
    ensure_installed = {
        "lua-language-server",
        "omnisharp-mono",
    },
}

return M
