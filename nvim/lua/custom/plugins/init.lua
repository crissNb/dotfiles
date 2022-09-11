return {
    ["neovim/nvim-lspconfig"] = {
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.plugins.lspconfig"
        end,
    },
    ["ray-x/lsp_signature.nvim"] = {},
    ["mfussenegger/nvim-jdtls"] = {}
}
