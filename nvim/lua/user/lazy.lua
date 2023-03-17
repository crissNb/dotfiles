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
		version = "nightly" -- optional, updated every week. (see issue #1193)
	},

	-- comment
	{
		'numToStr/Comment.nvim',
		lazy = false,
	}
	,

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
		name = 'catppuccin'
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
	{
		"L3MON4D3/LuaSnip",
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
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

	'sainnhe/sonokai',

	-- telescope
	'nvim-telescope/telescope.nvim',

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
	{
		'andweeb/presence.nvim',
		lazy = false,
		config = function()
			require("presence").setup({
				-- General options
				auto_update        = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
				neovim_image_text  = "imagine vscode", -- Text displayed when hovered over the Neovim image
				main_image         = "neovim", -- Main image display (either "neovim" or "file")
				client_id          = "793271441293967371", -- Use your own Discord application client id (not recommended)
				log_level          = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
				debounce_timeout   = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
				enable_line_number = false, -- Displays the current line number instead of the current project
				blacklist          = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
				buttons            = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
				file_assets        = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
				show_time          = true, -- Show the timer

				-- Rich Presence text options
				editing_text        = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
				file_explorer_text  = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
				git_commit_text     = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
				plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
				reading_text        = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
				workspace_text      = "smashing keyboard", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
				line_number_text    = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
			})
		end,
	},

	-- colors
	'norcalli/nvim-colorizer.lua',

	-- linters
	'jose-elias-alvarez/null-ls.nvim',

	-- project management
	'ahmedkhalf/project.nvim',

	'Yazeed1s/oh-lucy.nvim',
	-- undo tree
	'mbbill/undotree',
	'tpope/vim-fugitive',
	{ 'christoomey/vim-tmux-navigator',
		lazy = false },
})
