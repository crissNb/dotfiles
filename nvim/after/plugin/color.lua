-- vim.g.catppuccin_flavour = "mocha"
-- require("catppuccin").setup()
-- vim.cmd [[colorscheme catppuccin]]
-- require('ofirkai').setup {
-- }
-- vim.o.background = "dark" -- or "light" for light mode
-- vim.g.gruvbox_material_transparent_background = 1
-- vim.g.gruvbox_material_better_performance = 1
-- vim.g.gruvbox_material_background = "medium"
-- vim.g.gruvbox_material_foreground = "medium"
-- vim.g.gruvbox_material_enable_italic = 1
-- vim.cmd([[colorscheme gruvbox-material]])

vim.cmd("let g:gruvbox_transparent_bg = 1")
vim.cmd("autocmd VimEnter * hi Normal ctermbg=NONE guibg=NONE")
vim.cmd [[
  if (has("termguicolors"))
    set termguicolors
  endif
]]
vim.cmd.colorscheme("gruvbox")
require'colorizer'.setup()
