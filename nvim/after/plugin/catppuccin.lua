local colors = require("catppuccin.palettes").get_palette()

require("catppuccin").setup({
	transparent_background = true,
	term_colors = true,
	integrations = {
		treesitter = true,
		cmp = true,
		illuminate = true,
		harpoon = true,
		gitsigns = true,
		telescope = true,
		nvimtree = true,
		mason = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				-- errors = { "undercurl" },
				-- hints = { "undercurl" },
				-- warnings = { "undercurl" },
				-- information = { "undercurl" },
			},
		},
		dap = {
			enabled = true,
			enable_ui = true,
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
	},
	compile = {
		enabled = true,
		path = vim.fn.stdpath "cache" .. "/catppuccin"
	},
	color_overrides = {
		mocha = {
			rosewater = "#F5E0DC",
			flamingo = "#F2CDCD",
			mauve = "#DDB6F2",
			pink = "#F5C2E7",
			red = "#F28FAD",
			maroon = "#E8A2AF",
			peach = "#F8BD96",
			yellow = "#FAE3B0",
			teal = "#94E2D5",
			green = "#ABE9B3",
			blue = "#96CDFB",
			sky = "#89DCEB",
			lavender = "#C9CBFF",

			text = "#D9E0EE",
			subtext1 = "#BAC2DE",
			subtext0 = "#A6ADC8",
			overlay2 = "#C3BAC6",
			overlay1 = "#988BA2",
			overlay0 = "#6E6C7E",
			surface2 = "#6E6C7E",
			surface1 = "#575268",
			surface0 = "#302D41",

			base = "#1E1E2E",
			mantle = "#1A1826",
			crust = "#161320",
		},
	},
	highlight_overrides = {
		mocha = function(cp)
			return {
				-- CMP
				CmpItemKindSnippet = { fg = cp.base, bg = cp.mauve },
				CmpItemKindKeyword = { fg = cp.base, bg = cp.red },
				CmpItemKindText = { fg = cp.base, bg = cp.teal },
				CmpItemKindMethod = { fg = cp.base, bg = cp.blue },
				CmpItemKindConstructor = { fg = cp.base, bg = cp.blue },
				CmpItemKindFunction = { fg = cp.base, bg = cp.blue },
				CmpItemKindFolder = { fg = cp.base, bg = cp.blue },
				CmpItemKindModule = { fg = cp.base, bg = cp.blue },
				CmpItemKindConstant = { fg = cp.base, bg = cp.peach },
				CmpItemKindField = { fg = cp.base, bg = cp.green },
				CmpItemKindProperty = { fg = cp.base, bg = cp.green },
				CmpItemKindEnum = { fg = cp.base, bg = cp.green },
				CmpItemKindUnit = { fg = cp.base, bg = cp.green },
				CmpItemKindClass = { fg = cp.base, bg = cp.yellow },
				CmpItemKindVariable = { fg = cp.base, bg = cp.flamingo },
				CmpItemKindFile = { fg = cp.base, bg = cp.blue },
				CmpItemKindInterface = { fg = cp.base, bg = cp.yellow },
				CmpItemKindColor = { fg = cp.base, bg = cp.red },
				CmpItemKindReference = { fg = cp.base, bg = cp.red },
				CmpItemKindEnumMember = { fg = cp.base, bg = cp.red },
				CmpItemKindStruct = { fg = cp.base, bg = cp.blue },
				CmpItemKindValue = { fg = cp.base, bg = cp.peach },
				CmpItemKindEvent = { fg = cp.base, bg = cp.blue },
				CmpItemKindOperator = { fg = cp.base, bg = cp.blue },
				CmpItemKindTypeParameter = { fg = cp.base, bg = cp.blue },
				CmpItemKindCopilot = { fg = cp.base, bg = cp.teal },

				-- For base configs.
				CursorLineNr = { fg = cp.peach },
				LineNR = { fg = cp.rosewater },
				Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
				IncSearch = { bg = cp.pink, fg = cp.surface1 },

				-- For native lsp configs.
				DiagnosticVirtualTextError = { bg = cp.none },
				DiagnosticVirtualTextWarn = { bg = cp.none },
				DiagnosticVirtualTextInfo = { bg = cp.none },
				DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

				DiagnosticHint = { fg = cp.rosewater },
				LspDiagnosticsDefaultHint = { fg = cp.rosewater },
				LspDiagnosticsHint = { fg = cp.rosewater },
				LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
				LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

				-- For fidget.
				FidgetTask = { bg = cp.none, fg = cp.surface2 },
				FidgetTitle = { fg = cp.blue, style = { "bold" } },

				-- For treesitter.
				-- ["@field"] = { fg = cp.rosewater },
				-- ["@property"] = { fg = cp.yellow },
				--
				-- ["@include"] = { fg = cp.teal },
				-- ["@operator"] = { fg = cp.sky },
				-- ["@keyword.operator"] = { fg = cp.sky },
				-- ["@punctuation.special"] = { fg = cp.maroon },

				-- ["@float"] = { fg = cp.peach },
				-- ["@number"] = { fg = cp.peach },
				-- ["@boolean"] = { fg = cp.peach },

				-- ["@constructor"] = { fg = cp.lavender },
				-- ["@constant"] = { fg = cp.peach },
				-- ["@conditional"] = { fg = cp.mauve },
				-- ["@repeat"] = { fg = cp.mauve },
				-- ["@exception"] = { fg = cp.peach },

				-- ["@constant.builtin"] = { fg = cp.lavender },
				-- ["@function.builtin"] = { fg = cp.peach, style = { "italic" } },
				-- ["@type.builtin"] = { fg = cp.yellow, style = { "italic" } },
				-- ["@variable.builtin"] = { fg = cp.red, style = { "italic" } },

				-- ["@function"] = { fg = cp.blue },
				-- ["@function.macro"] = { fg = cp.red, style = {} },
				-- ["@parameter"] = { fg = cp.rosewater },
				-- ["@keyword.function"] = { fg = cp.maroon },
				-- ["@keyword"] = { fg = cp.red },
				-- ["@keyword.return"] = { fg = cp.pink, style = {} },

				-- ["@text.note"] = { fg = cp.base, bg = cp.blue },
				-- ["@text.warning"] = { fg = cp.base, bg = cp.yellow },
				-- ["@text.danger"] = { fg = cp.base, bg = cp.red },
				-- ["@constant.macro"] = { fg = cp.mauve },

				-- ["@label"] = { fg = cp.blue },
				-- ["@method"] = { style = { "italic" } },
				-- ["@namespace"] = { fg = cp.rosewater, style = {} },

				-- ["@punctuation.delimiter"] = { fg = cp.teal },
				-- ["@punctuation.bracket"] = { fg = cp.overlay2 },
				-- ["@string"] = { fg = cp.green },
				-- ["@string.regex"] = { fg = cp.peach },
				-- ["@type"] = { fg = cp.yellow },
				-- ["@variable"] = { fg = cp.text },
				-- ["@tag.attribute"] = { fg = cp.mauve, style = { "italic" } },
				-- ["@tag"] = { fg = cp.peach },
				-- ["@tag.delimiter"] = { fg = cp.maroon },
				-- ["@text"] = { fg = cp.text },

				-- ["@text.uri"] = { fg = cp.rosewater, style = { "italic", "underline" } },
				-- ["@text.literal"] = { fg = cp.teal, style = { "italic" } },
				-- ["@text.reference"] = { fg = cp.lavender, style = { "bold" } },
				-- ["@text.title"] = { fg = cp.blue, style = { "bold" } },
				-- ["@text.emphasis"] = { fg = cp.maroon, style = { "italic" } },
				-- ["@text.strong"] = { fg = cp.maroon, style = { "bold" } },
				-- ["@string.escape"] = { fg = cp.pink },

				-- ["@property.toml"] = { fg = cp.blue },
				-- ["@field.yaml"] = { fg = cp.blue },

				-- ["@label.json"] = { fg = cp.blue },
				--
				-- ["@function.builtin.bash"] = { fg = cp.red, style = { "italic" } },
				-- ["@parameter.bash"] = { fg = cp.yellow, style = { "italic" } },
				--
				-- ["@field.lua"] = { fg = cp.lavender },
				-- ["@constructor.lua"] = { fg = cp.flamingo },
				--
				-- ["@constant.java"] = { fg = cp.teal },
				--
				-- ["@property.typescript"] = { fg = cp.lavender, style = { "italic" } },
				-- ["@constructor.typescript"] = { fg = cp.lavender },

				-- ["@constructor.tsx"] = { fg = cp.lavender },
				-- ["@tag.attribute.tsx"] = { fg = cp.mauve },

				-- ["@type.css"] = { fg = cp.lavender },
				-- ["@property.css"] = { fg = cp.yellow, style = { "italic" } },
				--
				-- ["@property.cpp"] = { fg = cp.text },

				-- ["@symbol"] = { fg = cp.flamingo },
			}
		end,
	},
})

-- highlight cursorline
vim.wo.cursorline = true
vim.opt.cursorlineopt = "number"
