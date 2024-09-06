local illuminate_status_ok, illuminate = pcall(require, "illuminate")
if not illuminate_status_ok then
  return
end
illuminate.configure({
	providers = {
		'lsp',
	},
	delay = 0
})
