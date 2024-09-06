local chadtree_settings = {
    options = {
        lang = 'c'
    },
    ignore = {
        name_exact = {
            ".DS_Store",
            ".git",
            ".directory",
            "thumbs.db",
        },
        name_glob = {
            "*.meta"
        }
    },
    view = {
        width = 30
    },
    theme = {
        text_colour_set = "env",
        icon_colour_set = "github",
    }
}

vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
