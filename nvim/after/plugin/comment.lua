local status, comment = pcall(require, "Comment")
if not status then
	return
end

comment.setup {
	opleader = {
		line = '<leader>/'
	}
}

-- disable automatic comment on o
vim.cmd [[ autocmd FileType * set formatoptions-=o ]]
