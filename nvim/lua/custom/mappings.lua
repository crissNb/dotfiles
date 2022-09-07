local M = {}

M.general = {
    n = {
        -- Formatting
        ["<leader>fm"] = {
            function ()
                vim.lsp.buf.formatting()
            end,
            "Format file",
        },
        -- Floating terminal
        ["<leader>gg"] = {
            function ()
                require("nvterm.terminal").toggle "float"
            end,
        },
        -- Horizontal terminal
        ["<leader>gh"] = {
            function ()
                require("nvterm.terminal").toggle "horizontal"
            end,
        },
        -- Vertical terminal
        ["<leader>gv"] = {
            function ()
                require("nvterm.terminal").toggle "vertical"
            end,
        },
        -- Close buffer
        ["<C-w>"] = {
            function ()
                require("core.utils").close_buffer()
            end,
            "Close Tab"
        },
        -- Cycle through tabs
        ["<C-tab>"] = {
            function ()
                require("core.utils").tabuflineNext()
            end,
            "Next Tab"
        },
        ["<C-S-tab>"] = {
            function ()
                require("core.utils").tabuflinePrev()
           end,
           "Prev Tab"
        },
   }
}

return M
