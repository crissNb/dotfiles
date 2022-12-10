vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use) -- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- LSP + Treesitter
	use { 'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- nvim tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	-- comment
	use {
		'numToStr/Comment.nvim',
	}

	-- Status bar
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- git
	use {
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	}
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

	-- indent
	use { 'lukas-reineke/indent-blankline.nvim' }

	-- theme
	use { 'catppuccin/nvim', as = 'catppuccin' }
	use { "sainnhe/gruvbox-material" }

	-- LSP related
	use {
		'neovim/nvim-lspconfig',
		-- requires = {
		-- 	{ 'ms-jpq/coq_nvim', branch = 'coq' },
		-- 	{ 'ms-jpq/coq.artifacts', branch = 'artifacts' },
		-- },
	}

	use { 'williamboman/mason.nvim' }
	use { 'williamboman/mason-lspconfig.nvim' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-omni' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-cmdline' }
	use { 'hrsh7th/nvim-cmp' }
	-- use { 'ray-x/lsp_signature.nvim' }
	use { 'RRethy/vim-illuminate' }

	-- snippets
	use({ 'L3MON4D3/LuaSnip',
		tag = "v<CurrentMajor>.*",
		config = function()
			require("luasnip").config.setup({ history = true })
			require("luasnip.loaders.from_vscode").load()
		end,
	})
	use { "saadparwaiz1/cmp_luasnip" }
	use { "rafamadriz/friendly-snippets" }

	-- debugger
	use { 'mfussenegger/nvim-dap' }
	use { 'rcarriga/nvim-dap-ui' }

	-- java
	use { 'mfussenegger/nvim-jdtls' }

	-- improve neovim UI
	use { 'stevearc/dressing.nvim' }

	-- plenary
	use { 'nvim-lua/plenary.nvim' }

	-- telescope
	use { 'nvim-telescope/telescope.nvim' }

	-- neovim optimizations
	use { 'lewis6991/impatient.nvim' }

	-- terminal
	use { 'akinsho/toggleterm.nvim' }

	-- harpoon man
	use { 'ThePrimeagen/harpoon' }

	-- buffer manager
	use {'j-morano/buffer_manager.nvim' }

	-- latex
	use { 'lervag/vimtex',
		ft = { "tex", "bib" },
		config = 'require("user.vimtex")' }

	-- discord presence
	use { 'andweeb/presence.nvim' }

	-- colors
	use { 'norcalli/nvim-colorizer.lua' }

	-- linters
	use { 'jose-elias-alvarez/null-ls.nvim' }

	-- project management
	use { "ahmedkhalf/project.nvim" }

	-- navic + barbecue
	use {
		"utilyre/barbecue.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"smiteshp/nvim-navic",
			"kyazdani42/nvim-web-devicons", -- optional
		},
		after = "nvim-web-devicons", -- NOTICE: keep this if you're using NvChad
		config = function()
			require("barbecue").setup()
		end,
	}
end)
