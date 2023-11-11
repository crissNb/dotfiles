local M = {}

-- M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then
	return
end

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities()

M.on_attach = function(client, bufnr)
	-- navic
	-- if client.server_capabilities.documentSymbolProvider then
	-- 	require("nvim-navic").attach(client, bufnr)
	-- end

	require "lsp_signature".on_attach(signature_setup, bufnr)

	if client.name == "jdtls" then
		vim.lsp.codelens.refresh()
		require("jdtls").setup_dap { hotcodereplace = "auto" }
		require("jdtls.dap").setup_dap_main_class_configs()
	end
end

local servers = { "bashls", "pyright", "rust_analyzer", "gopls", "csharp_ls" }

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = M.on_attach,
        capabilities = M.capabilities
    })
end

nvim_lsp["lua_ls"].setup({
    on_attach = M.on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
    settings = {
        Lua = {
            diagnostics = {
                globals =  { "vim" },
            },
        }
    }
})

nvim_lsp["clangd"].setup({
    on_attach = M.on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
})

-- vim.schedule(function()
--     vim.cmd('COQnow -s')
--     for _, lsp in ipairs(servers) do
--         nvim_lsp[lsp].setup(coq.lsp_ensure_capabilities({
--             on_attach = M.on_attach,
--         }))
--
--
--   --       nvim_lsp[lsp].setup{
-- 		-- 	on_attach = M.on_attach,
-- 		-- }
--     end
--
-- end)


-- nvim_lsp["omnisharp"].setup({
-- 	on_attach = M.on_attach,
-- 	cmd = { "/Users/semi/.local/share/nvim/mason/bin/omnisharp-mono", "--languageserver", "--hostPID", tostring(pid) },
-- 	-- cmd = { "/Users/semi/Developer/Other/omnisharp-roslyn/artifacts/publish/OmniSharp.Stdio.Driver/mono/run", "--languageserver", "--hostPID", tostring(pid) },
-- })

return M
