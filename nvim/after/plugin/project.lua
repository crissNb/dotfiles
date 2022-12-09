local project_status_ok, project = pcall(require, "project_nvim")
if not project_status_ok then
	return
end

project.setup {
	detection_methods = { "pattern", "lsp" },
	exclude_dirs = { "~/.config/nvim/*" },
}
