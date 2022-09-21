local present, jabs = pcall(require, "jabs")
if not present then
	return
end

jabs.setup {
	position = 'center',
	width = 80,
	height = 20,
	border = 'single',
	offset = {
		top = 2,
		bottom = 2,
		left = 2,
		right = 2,
	},
	highlight = {
		current = "Special",
		hidden = "StatusLine",
		split = "StatusLine",
		alternate = "StatusLine",
	},
	use_devicons = true
}
