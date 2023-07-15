vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.updatetime = 50

vim.opt.termguicolors = true
vim.opt.cmdheight = 1

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.foldmethod = "expr"

vim.opt.colorcolumn = "80"

vim.cmd [[
    let &t_ti.="\eP\e[1 q\e\\"
    let &t_SI.="\eP\e[5 q\e\\"
    let &t_EI.="\eP\e[1 q\e\\"
    let &t_te.="\eP\e[0 q\e\\"
]]

-- mouse support
vim.api.nvim_set_option("mouse", "a")
vim.cmd "set noshowmode"
-- vim.cmd "set spell"

vim.o.expandtab = true
