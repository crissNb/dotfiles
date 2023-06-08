local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local config = {
    sources = { null_ls.builtins.formatting.csharpier }
}

local workingDir = vim.fn.getcwd();

local lastDirIndex
local target = string.byte("/")
for idx = 1, #workingDir do
	if workingDir:byte(idx) == target then
		lastDirIndex = idx
	end
end

local rootUpLevel = string.sub(workingDir, 0, lastDirIndex);

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

if file_exists("swt-checkstyle.xml") then
	config.sources = {
		null_ls.builtins.diagnostics.checkstyle.with({
			extra_args = {"-c ", "swt-checkstyle.xml"},
		}),
	}
end

null_ls.setup(config)
