require("flutter-tools").setup {
    debugger = {
        enabled = true,
        register_configurations = function(_)
            require("dap").configurations.dart = {}
        end,
    },
}

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
