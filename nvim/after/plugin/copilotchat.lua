require('CopilotChat').setup({
    chat_autocomplete=true,
    mappings = {
        complete = {
            insert = '',
        },
        reset = {
            normal = '<C-u>',
            insert = '<C-u>'
        },
    },
})
