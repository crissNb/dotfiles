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
        config = function ()
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
    -- 'lukas-reineke/indent-blankline.nvim',
    -- theme
    -- {
    --     'catppuccin/nvim',
    --     name = 'catppuccin'
    -- },
    {
        'Mofiqul/vscode.nvim'
    },
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
    -- discord presence
    {
        'andweeb/presence.nvim',
        config = function()
            require("presence").setup({
                -- General options
                auto_update         = true,                 -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
                neovim_image_text   = "imagine vscode",     -- Text displayed when hovered over the Neovim image
                main_image          = "neovim",             -- Main image display (either "neovim" or "file")
                client_id           = "793271441293967371", -- Use your own Discord application client id (not recommended)
                log_level           = nil,                  -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
                debounce_timeout    = 10,                   -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
                enable_line_number  = false,                -- Displays the current line number instead of the current project
                blacklist           = {},                   -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
                buttons             = true,                 -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
                file_assets         = {},                   -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
                show_time           = true,                 -- Show the timer
                -- Rich Presence text options
                editing_text        = "Editing %s",         -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
                file_explorer_text  = "Browsing %s",        -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
                git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
                plugin_manager_text = "Managing plugins",   -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
                reading_text        = "Reading %s",         -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
                workspace_text      = "smashing keyboard",  -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
                line_number_text    = "Line %s out of %s",  -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
            })
        end
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
    {
        'mikesmithgh/kitty-scrollback.nvim',
        enabled = true,
        lazy = true,
        cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
        event = { 'User KittyScrollbackLaunch' },
        -- version = '*', -- latest stable version, may have breaking changes if major version changed
        -- version = '^2.0.0', -- pin major version, include fixes and features that do not have breaking changes
        config = function()
            require('kitty-scrollback').setup()
        end,
    }
})
