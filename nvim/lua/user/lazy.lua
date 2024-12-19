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
    -- hover
    {
        "lewis6991/hover.nvim",
        config = function()
            require("hover").setup {
                init = function()
                    -- Require providers
                    require("hover.providers.lsp")
                    -- require('hover.providers.gh')
                    -- require('hover.providers.gh_user')
                    -- require('hover.providers.jira')
                    -- require('hover.providers.dap')
                    -- require('hover.providers.fold_preview')
                    require('hover.providers.diagnostic')
                    -- require('hover.providers.man')
                    -- require('hover.providers.dictionary')
                end,
                preview_opts = {
                    border = 'single'
                },
                -- Whether the contents of a currently open hover window should be moved
                -- to a :h preview-window when pressing the hover keymap.
                preview_window = false,
                title = true,
            }

            -- Setup keymaps
            vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
            vim.keymap.set("n", "gK", require("hover").hover_select, {desc = "hover.nvim (select)"})
            vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end, {desc = "hover.nvim (previous source)"})
            vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end, {desc = "hover.nvim (next source)"})
        end
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
        'projekt0n/github-nvim-theme',
    },
    {
        'sindrets/diffview.nvim',
        event = "VeryLazy"
    },
    {
        'nvim-flutter/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
    },
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
    -- {
    --     'nvim-telescope/telescope.nvim',
    --     lazy = true
    -- },
    -- FZF
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        opts = {
            debug = true, -- Enable debugging
            -- See Configuration section for rest
        },
        -- See Commands section for default commands if you want to lazy load on them
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
