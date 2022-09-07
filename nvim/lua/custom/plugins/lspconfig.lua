local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = { "omnisharp" }
local pid = vim.fn.getpid()

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
 end

lspconfig.omnisharp.setup {
    cmd = { "/Users/semi/.local/share/nvim/mason/bin/omnisharp-mono", "--languageserver", "--hostPID", tostring(pid) },
}

cfg = {}
require("lsp_signature").setup(cfg)
