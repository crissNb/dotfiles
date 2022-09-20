vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use) -- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- LSP + Treesitter
	use 'nvim-treesitter/nvim-treesitter'

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

	-- autopairs
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
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

	-- auto scroll
	use {
		'karb94/neoscroll.nvim'
	}

	-- indent
	use { 'lukas-reineke/indent-blankline.nvim' }

	-- theme
	use { 'catppuccin/nvim', as = 'catppuccin' }

	-- LSP related
	use { 'ray-x/lsp_signature.nvim' }

	use { 'neovim/nvim-lspconfig' }
	use { 'williamboman/mason.nvim' }
	use { 'williamboman/mason-lspconfig.nvim' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-cmdline' }
	use { 'hrsh7th/nvim-cmp' }
	use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
	use { 'saadparwaiz1/cmp_luasnip' }

	-- debugger
	use { 'mfussenegger/nvim-dap' }
	use { 'rcarriga/nvim-dap-ui' }

	-- java
	use { 'mfussenegger/nvim-jdtls' }

	-- make
	use { 'tpope/vim-dispatch' }

	-- improve neovim UI
	use { 'stevearc/dressing.nvim'}
	use { 'p00f/nvim-ts-rainbow' }
end)
