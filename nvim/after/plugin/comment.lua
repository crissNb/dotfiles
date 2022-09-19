local status, indent_blankline = pcall(require, "comment")
if not status then
  return
end

indent_blankline.setup {
	opleader = {
		line = '<leader>/'
	}
}
