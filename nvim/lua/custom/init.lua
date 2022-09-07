local o = vim.o
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

vim.wo.relativenumber = true

vim.cmd [[
  inoremap <ESC><bs> <C-w>
]]
