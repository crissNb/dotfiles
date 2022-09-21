local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local function nkeymap(key, map)
	keymap('n', key, map, opts)
end

-- leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "
nkeymap("<Space>", "")

--
-- Normal --
-- switch between windows
nkeymap('<C-h>', '<C-w>h')
nkeymap('<C-l>', '<C-w>l')
nkeymap('<C-j>', '<C-w>j')
nkeymap('<C-k>', '<C-w>k')

-- nvim tree
nkeymap("<leader>e", ":NvimTreeToggle<CR>")

-- lsp
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>a', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
nkeymap('<leader>fm', ':lua vim.lsp.buf.formatting()<cr>')

-- telescope
nkeymap("<leader>ff", ":lua require('telescope.builtin').find_files()<cr>")
nkeymap('<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>")
nkeymap('<leader>fb', ":lua require('telescope.builtin').buffers()<cr>")

-- JABS (buffer management)
nkeymap('<leader>b', ':JABSOpen<cr>')

-- terminal
nkeymap('<leader>tt', ":ToggleTerm<cr>")
nkeymap('<leader>th', ":ToggleTerm direction=horizontal<cr>")
nkeymap('<leader>tv', ":ToggleTerm direction=vertical<cr>")
