local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
    -- LSP + Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    -- {
    --     'nvim-tree/nvim-tree.lua'
    -- },
    {
        'ms-jpq/chadtree',
        branch = "chad",
        build = "python3 -m chadtree deps",
    },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    },
    {
        'hrsh7th/nvim-cmp'
    },
    {
        'hrsh7th/cmp-path'
    },
    {
        'onsails/lspkind.nvim'
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    },
    {
        "rafamadriz/friendly-snippets"
    },
    {
        'saadparwaiz1/cmp_luasnip'
    },
    -- comment
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },
    -- {
    --     'ms-jpq/coq_nvim',
    --     branch = "coq",
    -- },
    -- {
    --     'ms-jpq/coq.thirdparty',
    --     branch = "3p",
    -- },
    -- {
    --     'ms-jpq/coq.artifacts',
    --     branch = "artifacts",
    -- },
    -- Status bar
    -- {
    --     'nvim-lualine/lualine.nvim',
    --     dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
    -- },
    -- git
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },
    {
        'sindrets/diffview.nvim',
        event = "VeryLazy"
    },
    dependencies = 'nvim-lua/plenary.nvim',
    -- indent
    'lukas-reineke/indent-blankline.nvim',
    -- LSP related
    {
        'neovim/nvim-lspconfig',
    },
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    {
        'RRethy/vim-illuminate',
        lazy = true,
    },
    'ray-x/lsp_signature.nvim',
    -- debugger
    {
        'mfussenegger/nvim-dap',
        ft = "java"
    },
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    { "folke/neodev.nvim", opts = {} },
    -- java
    {
        'mfussenegger/nvim-jdtls',
        ft = "java"
    },
    -- plenary
    'nvim-lua/plenary.nvim',
    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        lazy = true
    },
    {
        'nvim-telescope/telescope-project.nvim'
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    -- terminal
    {
        'akinsho/toggleterm.nvim',
        lazy = true
    },
    -- harpoon man
    'ThePrimeagen/harpoon',
    -- buffer manager
    {
        'j-morano/buffer_manager.nvim',
        event = "VeryLazy"
    },
    -- latex
    {
        'lervag/vimtex',
        ft = { "tex", "bib" },
        config = function() require("user.vimtex") end,
    },
    -- colors
    'norcalli/nvim-colorizer.lua',
    -- linters
    'jose-elias-alvarez/null-ls.nvim',
    -- undo tree
    {
        'mbbill/undotree',
    },
    {
        'christoomey/vim-tmux-navigator',
        lazy = false
    },
    {
        "utilyre/sentiment.nvim",
        version = "*",
        event = "VeryLazy", -- keep for lazy loading
        opts = {
            -- config
        },
        init = function()
            -- `matchparen.vim` needs to be disabled manually in case of lazy loading
            vim.g.loaded_matchparen = 1
        end,
    },
    { "zbirenbaum/copilot.lua" },
})
