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
            "*.meta"
        }
    },
    view = {
        width = 30
    }
}

vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
