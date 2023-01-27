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

	-- nvim tree
	{
		'kyazdani42/nvim-tree.lua',
		dependencies = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		version = 'nightly' -- optional, updated every week. (see issue #1193)
	},

	-- comment
	'numToStr/Comment.nvim',

	-- Status bar
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
	},

	-- git
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},
	'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim',

	-- indent
	'lukas-reineke/indent-blankline.nvim',

	-- theme
	{
		'catppuccin/nvim',
		as = 'catppuccin'
	},

	-- LSP related
	{
		'neovim/nvim-lspconfig',
	},

	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-omni',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'ray-x/lsp_signature.nvim',
	'RRethy/vim-illuminate',
	'onsails/lspkind.nvim',

	-- snippets
	{ 'L3MON4D3/LuaSnip',
		version = "v<CurrentMajor>.*",
		config = function()
			require("luasnip").config.setup({ history = true })
			require("luasnip.loaders.from_vscode").load()
		end,
	},
	'saadparwaiz1/cmp_luasnip',
	'rafamadriz/friendly-snippets',

	-- debugger
	'mfussenegger/nvim-dap',
	'rcarriga/nvim-dap-ui',

	-- java
	'mfussenegger/nvim-jdtls',

	-- plenary
	'nvim-lua/plenary.nvim',

	-- telescope
	'nvim-telescope/telescope.nvim',

	-- neovim optimizations
	'lewis6991/impatient.nvim',

	-- terminal
	'akinsho/toggleterm.nvim',

	-- harpoon man
	'ThePrimeagen/harpoon',

	-- buffer manager
	'j-morano/buffer_manager.nvim',

	-- latex
	{ 'lervag/vimtex',
		ft = { "tex", "bib" },
		config = function() require("user.vimtex") end,
	},

	-- discord presence
	'andweeb/presence.nvim',

	-- colors
	'norcalli/nvim-colorizer.lua',

	-- linters
	'jose-elias-alvarez/null-ls.nvim',

	-- project management
	'ahmedkhalf/project.nvim',

	-- Omnisharp
	-- { "OmniSharp/omnisharp-vim" }
	-- { "Shougo/deoplete.nvim",
	-- 	config = 'require("user.deoplete")' }
	-- { "dense-analysis/ale" }

	-- undo tree
	'mbbill/undotree',
	'tpope/vim-fugitive',
	'j-hui/fidget.nvim',
	'christoomey/vim-tmux-navigator'
})
