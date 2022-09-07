local M = {}

local override = require "custom.override"

M.ui = {
    theme = "gruvbox",
}

M.plugins = {
    override = {
        ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
        ["NvChad/ui"] = {
            statusline = {
                separator_style = "block",
            },
        },
        ["williamboman/mason.nvim"] = override.mason,
    },

    user = require "custom.plugins",
}

M.mappings = require "custom.mappings"

return M
