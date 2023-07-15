vim.cmd [[
let g:coq_settings = { 'display.icons.mode': 'none' }
]]

vim.g.coq_settings = {
    -- Other settings...
    ["keymap.jump_to_mark"] = '<c-z>',
    ["clients.buffers.enabled"] = false,
    ["clients.tmux.enabled"] = false
}
