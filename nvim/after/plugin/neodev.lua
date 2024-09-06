local neodev_status_ok, neodev = pcall(require, "neodev")
if not neodev_status_ok then
	return
end

neodev.setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})
