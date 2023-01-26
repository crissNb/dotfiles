vim.cmd([[
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
]])

vim.cmd([[
call deoplete#enable()
]])

-- omnisharp shortcuts
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap('n', 'gd', ':OmniSharpGotoDefinition<cr>', opts)
keymap('n', 'gD', ':OmniSharpPreviewDefinition<cr>', opts)
keymap('n', 'gi', ':OmniSharpFindImplementations<cr>', opts)
keymap('n', 'gI', ':OmniSharpPreviewImplementation<cr>', opts)

keymap('n', '<leader>rn', ':OmniSharpRename<cr>', opts)
keymap('n', '<leader>fm', ':OmniSharpCodeFormat<cr>', opts)

keymap('n', 'gr', ':OmniSharpFindUsages<cr>', opts)
keymap('n', '<leader>a', ':OmniSharpGetCodeActions<cr>', opts)

keymap('n', '<leader>cc', ':OmniSharpGlobalCodeCheck<cr>', opts)

keymap('n', '<leader>RR', ':OmniSharpReloadProject<cr>', opts)

keymap('n', 'K', ':OmniSharpDocumentation<cr>', opts)

keymap('i', '<C-h>', ':OmniSharpSignatureHelp<cr>', opts)
