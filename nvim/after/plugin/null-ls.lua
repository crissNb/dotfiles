local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local workingDir = vim.fn.getcwd();

local lastDirIndex
local target = string.byte("/")
for idx = 1, #workingDir do
	if workingDir:byte(idx) == target then
		lastDirIndex = idx
	end
end

local rootUpLevel = string.sub(workingDir, 0, lastDirIndex);

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.checkstyle.with({
			extra_args = { "-c", rootUpLevel .. "/checkstyle-optional.xml" },
		}),
	}
})
