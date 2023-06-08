-- local colors = {
-- 	red = '#cdd6f4',
-- 	grey = '#181825',
-- 	black = '#1e1e2e',
-- 	white = '#313244',
-- 	light_green = '#6c7086',
-- 	orange = '#fab387',
-- 	green = '#a6e3a1',
-- 	blue = '#80A7EA',
-- }
--
-- local theme = {
-- 	normal = {
-- 		a = { fg = colors.black, bg = colors.blue },
-- 		b = { fg = colors.blue, bg = colors.white },
-- 		c = { fg = colors.white, bg = colors.black },
-- 		z = { fg = colors.white, bg = colors.black },
-- 	},
-- 	insert = { a = { fg = colors.black, bg = colors.orange } },
-- 	visual = { a = { fg = colors.black, bg = colors.green } },
-- 	replace = { a = { fg = colors.black, bg = colors.green } },
-- }
--
-- local vim_icons = {
-- }
--
-- local space = {
-- 	function()
-- 		return " "
-- 	end,
-- 	color = { bg = colors.black, fg = "#80A7EA" },
-- }
--
-- local filename = {
-- 	'filename',
-- 	color = { bg = "#80A7EA", fg = "#242735" },
-- 	separator = { left = "", right = "" },
-- }
--
-- local filetype = {
-- 	"filetype",
-- 	icon_only = true,
-- 	colored = true,
-- 	color = { bg = "#313244" },
-- 	separator = { left = "", right = "" },
-- }
--
-- local filetype_tab = {
-- 	"filetype",
-- 	icon_only = true,
-- 	colored = true,
-- 	color = { bg = "#313244" },
-- }
--
-- local fileformat = {
-- 	'fileformat',
-- 	color = { bg = "#b4befe", fg = "#313244" },
-- 	separator = { left = "", right = "" },
-- }
--
-- local encoding = {
-- 	'encoding',
-- 	color = { bg = "#313244", fg = "#80A7EA" },
-- 	separator = { left = "", right = "" },
-- }
--
-- local branch = {
-- 	'branch',
-- 	color = { bg = "#a6e3a1", fg = "#313244" },
-- 	separator = { left = "", right = "" },
-- }
--
-- local diff = {
-- 	"diff",
-- 	color = { bg = "#313244", fg = "#313244" },
-- 	separator = { left = "", right = "" },
-- }
--
-- local modes = {
-- 	'mode', fmt = function(str) return str end,
-- 	color = { bg = "#fab387		", fg = "#1e1e2e" },
-- 	separator = { left = "", right = "" },
-- }
--
-- local function getLspName()
-- 	local msg = 'No Active Lsp'
-- 	local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
-- 	local clients = vim.lsp.get_active_clients()
-- 	if next(clients) == nil then
-- 		return msg
-- 	end
-- 	for _, client in ipairs(clients) do
-- 		local filetypes = client.config.filetypes
-- 		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
-- 			return "  " .. client.name
-- 		end
-- 	end
-- 	return "  " .. msg
-- end
--
-- local dia = {
-- 	'diagnostics',
-- 	color = { bg = "#313244", fg = "#80A7EA" },
-- 	separator = { left = "", right = "" },
-- }
--
-- local lsp = {
-- 	function()
-- 		return getLspName()
-- 	end,
-- 	separator = { left = "", right = "" },
-- 	color = { bg = "#fab387", fg = "#1e1e2e" },
-- }

require('lualine').setup {

	options = {
		icons_enabled = true,
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	--
	-- sections = {
	-- 	lualine_a = {
	-- 		--{ 'mode', fmt = function(str) return str:gsub(str, "  ") end },
	-- 		modes,
	-- 		-- vim_icons,
	-- 		--{ 'mode', fmt = function(str) return str:sub(1, 1) end },
	-- 	},
	-- 	lualine_b = {
	-- 		space,
	--
	-- 	},
	-- 	lualine_c = {
	--
	-- 		filename,
	-- 		filetype,
	-- 		space,
	-- 		branch,
	-- 		diff,
	-- 	},
	-- 	lualine_x = {
	-- 		space,
	-- 	},
	-- 	lualine_y = {
	-- 		encoding,
	-- 		fileformat,
	-- 		space,
	-- 	},
	-- 	lualine_z = {
	-- 		dia,
	-- 		lsp,
	-- 	}
	-- },
	-- inactive_sections = {
	-- 	lualine_a = {},
	-- 	lualine_b = {},
	-- 	lualine_c = { 'filename' },
	-- 	lualine_x = { 'location' },
	-- 	lualine_y = {},
	-- 	lualine_z = {}
	-- },
	-- tabline = {
	-- 	lualine_a = {
	-- 		buffer,
	-- 	},
	-- 	lualine_b = {
	-- 	},
	-- 	lualine_c = {},
	-- 	lualine_x = {
	-- 		tabs,
	-- 	},
	-- 	lualine_y = {
	-- 		space,
	-- 	},
	-- 	lualine_z = {
	-- 	},
	-- },
	-- winbar = {},
	-- inactive_winbar = {},

}
