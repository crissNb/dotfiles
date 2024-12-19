local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

local function nkeymap(key, map)
	keymap('n', key, map, opts)
end

-- make x act like delete
keymap('n', 'x', '"_x', opts)
keymap('v', 'x', '"_d', opts)

-- move selected line / block of text in visual mode
keymap("v", "K", ":move '<-2<CR>gv=gv", opts)
keymap("v", "J", ":move '>+1<CR>gv=gv", opts)

keymap("n", "J", "mzJ`z", opts)

-- copilot
keymap("i", "<C-]>", "<Plug>(copilot-next)", opts)
keymap("i", "<C-[>", "<Plug>(copilot-previous)", opts)

-- terminal
keymap('t', '<esc>', '<C-\\><C-N>', opts)

-- leader
vim.g.maplocalleader = " "
nkeymap("<Space>", "")

-- global clipboard copypaste
keymap("x", "<leader>op", "\"_dP", opts)

nkeymap("<leader>y", "\"+y")
nkeymap("<leader>Y", "\"+Y")
keymap('v', "<leader>y", "\"+y", opts)

nkeymap("<leader>p", "\"+P")
keymap('v', "<leader>p", "\"+P", opts)

nkeymap("Q", "<nop>")

-- Git
vim.keymap.set("n", "<leader>gg", vim.cmd.Git);

-- Tmux
-- keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)

-- Normal --
-- switch between windows
-- nkeymap('<C-h>', '<C-w>h')
-- nkeymap('<C-l>', '<C-w>l')
-- nkeymap('<C-j>', '<C-w>j')
-- nkeymap('<C-k>', '<C-w>k')

-- Remap move down/ move up
nkeymap('<C-d>', '<C-d>zz')
nkeymap('<C-u>', '<C-u>zz')

-- Remap searches
nkeymap('n', 'nzzzv')
nkeymap('N', 'Nzzzv')

-- remap movement
nkeymap('j', 'gj')
nkeymap('k', 'gk')

-- nvim tree
-- nkeymap("<leader>e", ":NvimTreeToggle<CR>")
nkeymap("<leader>e", ":CHADopen<CR>")

-- lsp
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
-- nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gr', ':lua require("fzf-lua").lsp_references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('<leader>a', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
nkeymap('<leader>fm', ':lua vim.lsp.buf.format({ async = true })<cr>')
nkeymap("[d", ':lua vim.diagnostic.goto_prev()<cr>')
nkeymap("]d", ':lua vim.diagnostic.goto_next()<cr>')
-- nkeymap("K", ":lua vim.lsp.buf.hover()<cr>")
vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)

-- telescope
-- nkeymap("<leader>ff", ":lua require('telescope.builtin').find_files()<cr>")
-- nkeymap('<leader>fg', ":lua require('telescope.builtin').live_grep()<cr>")
-- nkeymap('<leader>fb', ":lua require('telescope.builtin').buffers()<cr>")
-- nkeymap('<leader>fp', ":lua require'telescope'.extensions.project.project{display_type = 'full'}<cr>")

nkeymap('<leader>ff', ":lua require('fzf-lua').files()<cr>")
nkeymap('<leader>fg', ":lua require('fzf-lua').live_grep()<cr>")
nkeymap('<leader>fp', ':lua Fzfprojects({"~/Developer","~/semikoder"})<cr>')

-- Unity
nkeymap('<leader>fs', ":lua require('user.telescope').search_unity_scripts()<cr>")

-- Undo tree
nkeymap('<leader>uu', ":UndotreeToggle<CR>")

-- terminal
nkeymap('<leader>tt', ":ToggleTerm<cr>")
nkeymap('<leader>th', ":ToggleTerm direction=horizontal<cr>")
nkeymap('<leader>tv', ":ToggleTerm direction=vertical<cr>")

-- jdtls
-- test
nkeymap('<leader>jt', ":lua require'jdtls'.test_nearest_method()<CR>")
nkeymap('<leader>jT', ":lua require'jdtls'.test_class()<CR>")
nkeymap('<leader>jS', ":lua require('jdtls.dap').setup_dap_main_class_configs()<CR>")

-- refactoring
nkeymap('<leader>jv', ":lua require'jdtls'.extract_variable(true)<CR>")
nkeymap('<leader>jc', ":lua require'jdtls'.extract_constant(true)<CR>")
nkeymap('<leader>jm', ":lua require'jdtls'.extract_method(true)<CR>")
nkeymap('<leader>jo', ":lua require'jdtls'.organize_imports()<CR>")

-- dap (debugging)
nkeymap('<leader>b', ":lua require'dap'.toggle_breakpoint()<CR>")
nkeymap('<leader>n', ":lua require'dap'.continue()<CR>")
nkeymap('<leader>dg', ":lua require'dap'.step_into()<CR>")
nkeymap('<leader>do', ":lua require'dapui'.toggle()<CR>")

-- harpoon man
nkeymap('<C-e>', ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
nkeymap('<leader>mm', ":lua require('harpoon.mark').add_file()<CR>")
nkeymap('<leader>z', ":lua require('harpoon.ui').nav_file(1)<CR>")
nkeymap('<leader>x', ":lua require('harpoon.ui').nav_file(2)<CR>")
nkeymap('<leader>c', ":lua require('harpoon.ui').nav_file(3)<CR>")
nkeymap('<leader>v', ":lua require('harpoon.ui').nav_file(4)<CR>")

-- diffview
nkeymap('<leader>gd', ":DiffviewOpen<CR>")
nkeymap('<leader>gq', ":DiffviewClose<CR>")

-- jabs
nkeymap('<leader>bm', ":lua require('buffer_manager.ui').toggle_quick_menu()<CR>")

-- -- coq
vim.cmd [[
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
]]

-- copilot
nkeymap('<leader>gc', ":Copilot panel<CR>")
nkeymap('<leader>cc', ":CopilotChat<CR>")
keymap('v', "<leader>cc", ":CopilotChat<CR>", opts)

-- ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
-- ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
-- ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
-- ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"
