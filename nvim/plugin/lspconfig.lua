local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then
	return
end

local on_attach = function(client, bufnr)
	-- lsp signature
	require "lsp_signature".on_attach({
		bind = true,
		handler_opts = {
			border = "rounded"
		}
	}, bufnr)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp['sumneko_lua'].setup {
	capabilities = capabilities;
	on_attach = on_attach,
}

nvim_lsp["omnisharp"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
    cmd = { "/Users/semi/.local/share/nvim/mason/bin/omnisharp-mono", "--languageserver", "--hostPID", tostring(pid) },
}

nvim_lsp["jdtls"].setup {
	capabilities = capabilities,
	on_attach = on_attach,
}
