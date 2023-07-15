-- local colors = require("catppuccin.palettes").get_palette()
-- local colors_gruvbox = {
--     dark0_hard = "#1d2021",
--     dark0 = "#282828",
--     dark0_soft = "#32302f",
--     dark1 = "#3c3836",
--     dark2 = "#504945",
--     dark3 = "#665c54",
--     dark4 = "#7c6f64",
--     light0_hard = "#f9f5d7",
--     light0 = "#fbf1c7",
--     light0_soft = "#f2e5bc",
--     light1 = "#ebdbb2",
--     light2 = "#d5c4a1",
--     light3 = "#bdae93",
--     light4 = "#a89984",
--     bright_red = "#fb4934",
--     bright_green = "#b8bb26",
--     bright_yellow = "#fabd2f",
--     bright_blue = "#83a598",
--     bright_purple = "#d3869b",
--     bright_aqua = "#8ec07c",
--     bright_orange = "#fe8019",
--     -- common
--     neutral_red = "#cc241d",
--     neutral_green = "#98971a",
--     neutral_yellow = "#d79921",
--     neutral_blue = "#458588",
--     neutral_purple = "#b16286",
--     neutral_aqua = "#689d6a",
--     neutral_orange = "#d65d0e",
--     -- light theme
--     faded_red = "#9d0006",
--     faded_green = "#79740e",
--     faded_yellow = "#b57614",
--     faded_blue = "#076678",
--     faded_purple = "#8f3f71",
--     faded_aqua = "#427b58",
--     faded_orange = "#af3a03",
--
--     gray = "#928374",
-- }
--
-- require("catppuccin").setup({
--     transparent_background = false,
--     term_colors = true,
--     integrations = {
--         treesitter = true,
--         illuminate = true,
--         harpoon = true,
--         gitsigns = true,
--         telescope = true,
--         nvimtree = true,
--         mason = true,
--         coc_nvim = true,
--         native_lsp = {
--             enabled = true,
--             virtual_text = {
--                 errors = { "italic" },
--                 hints = { "italic" },
--                 warnings = { "italic" },
--                 information = { "italic" },
--             },
--             underlines = {
--                 errors = { "undercurl" },
--                 hints = { "undercurl" },
--                 warnings = { "undercurl" },
--                 information = { "undercurl" },
--             },
--         },
--         dap = {
--             enabled = true,
--             enable_ui = true,
--         },
--         indent_blankline = {
--             enabled = true,
--             colored_indent_levels = false,
--         },
--     },
--     compile = {
--         enabled = true,
--         path = vim.fn.stdpath "cache" .. "/catppuccin"
--     },
--     no_italic = false,    -- Force no italic
--     no_bold = false,      -- Force no bold
--     no_underline = false, -- Force no underline
--     styles = {
--         comments = { "italic" },
--         conditionals = { "italic" },
--         loops = { "italic" },
--         functions = { "bold" },
--         keywords = { "italic" },
--         strings = {},
--         variables = {},
--         numbers = { "bold" },
--         booleans = { "italic" },
--         properties = {},
--         types = { "bold" },
--         operators = {},
--     },
--     color_overrides = {
--         mocha = {
--             -- Gruvbox_mix-medium from https://github.com/sainnhe/gruvbox-material
--             -- gruvbox -- alternate (https://github.com/thanhvule0310) -- Catppuccin
--             --                                         current    alt     catp    gruv_mat
--             rosewater = "#ffc6be",                 -- #ffc6be  #EA6962  #F5E0DC
--             flamingo = "#fb4934",                  -- #fb4934  #F38BA8  #F2CDCD
--             pink = "#ffd3e2",                      --          #D3869B  #F5C2E7
--             mauve = "#d3869b",                     --          #D3869B" #CBA6F7
--             red = "#f2594b",                       --          #EA6962  #F38BA8
--             maroon = "#fe8019",                    --          #EA6962  #EBA0AC
--             peach = "#b57614",                     -- #b57614  #c68e6b  #FAB387
--             yellow = "#e9b143",                    -- #e9b143  #D8A657  #F9E2AF
--             green = "#b0b846",                     --                   #A6E3A1
--             teal = "#89B482",                      --                   #94E2D5
--             sky = "#83a598",                       --          #89B482  #89DCEB
--             sapphire = "#689d6a",                  --          #89B482  #74C7EC
--             blue = "#458588",                      --          #7DAEA3  #87B0F9
--             lavender = "#b39ddb",                  --                   #B4BEFE
--             text = colors_gruvbox.light1,          -- #ebdbb2  #D4BE98  #C6D0F5
--             subtext1 = colors_gruvbox.light0_soft, -- #f2e5bc         #BDAE8B  #B3BCDF
--             subtext0 = colors_gruvbox.light2,      -- #d5c4a1         #A69372  #A1A8C9
--             overlay2 = colors_gruvbox.light3,      -- #bdae93  #8C7A58  #8E95B3
--             overlay1 = colors_gruvbox.light4,      -- #a89984  #735F3F  #7B819D
--             overlay0 = colors_gruvbox.gray,        -- #928374  #806234  #696D86
--             surface2 = colors_gruvbox.dark3,       -- "#6E7477"#4B4F51",  #565970
--             surface1 = colors_gruvbox.dark1,       -- "#2A2D2E", --           #43465A
--             surface0 = colors_gruvbox.dark0_soft,  --  "#232728", --     #313244
--             base = "#282828",                      -- "#1D2021", --               #1E1E2E
--             mantle = "#1d2021",                    -- "#191C1D",           #181825
--             crust = "#1b1b1b",                     --                                       #11111B
--         },
--     },
--     custom_highlights = function(colors)
--         return {
--             NormalFloat = { bg = colors.surface0 },
--             FloatBorder = { fg = colors.overlay0 },
--             VertSplit = { bg = colors.base, fg = colors.surface1 },
--             CursorLineNr = { fg = colors.mauve, style = { "bold" } },
--             LineNr = { fg = colors.overlay0 },
--             Pmenu = { bg = colors.mantle, fg = "" },
--             PmenuSel = { bg = colors.surface0, fg = colors.subtext0 },
--             TelescopeSelection = { bg = colors.surface0 },
--             TelescopePromptCounter = { fg = colors.mauve, style = { "bold" } },
--             TelescopePromptPrefix = { bg = colors.surface0 },
--             TelescopePromptNormal = { bg = colors.surface0 },
--             TelescopeResultsNormal = { bg = colors.mantle },
--             TelescopePreviewNormal = { bg = colors.crust },
--             TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
--             TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
--             TelescopePreviewBorder = { bg = colors.crust, fg = colors.crust },
--             TelescopePromptTitle = { fg = colors.surface0, bg = colors.surface0 },
--             TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
--             TelescopePreviewTitle = { fg = colors.crust, bg = colors.crust },
--             -- IndentBlanklineChar = { fg = colors.surface0 },
--             -- IndentBlanklineContextChar = { fg = colors.surface2 },
--             GitSignsChange = { fg = colors.peach },
--             -- Blamer = { fg = colors.overlay1, bg = colors.base },
--             -- NvimTreeIndentMarker = { link = "IndentBlanklineChar" },
--             -- NvimTreeExecFile = { fg = colors.text },
--             Function = { fg = colors.lavender, style = { "italic" } },
--             Type = { fg = colors.blue },
--             Structure = { fg = colors.teal },
--             Comment = { fg = colors.surface2 },
--             cTypedef = { fg = colors.pink, style = { "italic" } },
--             cDefine = { fg = colors.pink, style = { "italic" } },
--             cStructure = { fg = colors.yellow },
--             StorageClass = { fg = colors.pink, style = { "italic" } },
--             cStorageclass = { fg = colors.pink, style = { "italic" } },
--             PreProc = { fg = colors.maroon, style = { "italic" } },
--             Keyword = { fg = colors.flamingo },
--             Conditional = { fg = colors.red },
--             Repeat = { fg = colors.red },
--             ["@keyword.return"] = { fg = colors.flamingo, style = { "italic" } },
--             ["@parameter"] = { fg = colors.subtext0, style = { "italic" } },
--             ["@property"] = { fg = colors.yellow },
--             WinBar = { fg = colors.overlay2, bg = colors.mantle },
--             -- TabLineSel = { bg = colors.pink },
--             -- CmpBorder = { fg = colors.surface2 },
--             --  Pmenu = { bg = C.none },
--         }
--     end,
--     highlight_overrides = {
--         all = function(colors)
--             return {
--                 -- Comment = { fg = colors.flamingo },
--                 -- NvimTreeNormal = { fg = colors.none },
--                 -- CmpBorder = { fg = "#3e4145" },
--             }
--         end,
--     },
-- })

require("catppuccin").setup({
    transparent_background = false,
    term_colors = true,
    integrations = {
        treesitter = true,
        illuminate = true,
        harpoon = true,
        gitsigns = true,
        telescope = true,
        nvimtree = true,
        mason = true,
        coc_nvim = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
                information = { "undercurl" },
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
    no_italic = false,    -- Force no italic
    no_bold = false,      -- Force no bold
    no_underline = false, -- Force no underline
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "italic" },
        functions = { "bold" },
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = { "bold" },
        booleans = { "italic" },
        properties = {},
        types = { "bold" },
        operators = {},
    },
})

-- highlight cursorline
vim.wo.cursorline = true
vim.opt.cursorlineopt = "number"
