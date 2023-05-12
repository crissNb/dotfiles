local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end
local home = os.getenv "HOME"
-- find_root looks for parent directories relative to the current buffer containing one of the given arguments.
if vim.fn.has "mac" == 1 then
	WORKSPACE_PATH = home .. "/workspace/"
elseif vim.fn.has "unix" == 1 then
	WORKSPACE_PATH = home .. "/workspace/"
else
	print "Unsupported system"
end

local root_markers = { ".gitmodules", ".git/" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
	return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
JAVA_LS_EXECUTABLE = home .. "/.local/share/nvim/mason/bin/jdtls"

local bundles = {
	vim.fn.glob(home ..
		"/.config/nvim/DebugAdapters/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
};

-- This is the new part
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.config/nvim/DebugAdapters/java/vscode-java-test/server/*.jar"), "\n"))
vim.list_extend(
	bundles,
	vim.split(
		vim.fn.glob(
			home .. "/.config/nvim/DebugAdapters/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
		),
		"\n"
	)
)

jdtls.start_or_attach {
	-- on_attach = function(client, bufnr)
	--   -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
	--   -- you make during a debug session immediately.
	--   -- Remove the option if you do not want that.
	--   require("jdtls").setup_dap { hotcodereplace = "auto" }
	-- end,
	init_options = {
		bundles = bundles,
	},
	flags = {
		allow_incremental_sync = true,
	},
	root_dir = root_dir,
	cmd = {
		"/usr/bin/java", -- or '/path/to/java11_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.

		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
		"-Xms1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		"-jar",
		vim.fn.glob("/Users/semi/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
		-- Must point to the                                                     Change this to
		-- eclipse.jdt.ls installation                                           the actual version

		"-configuration",
		"/Users/semi/.local/share/nvim/mason/packages/jdtls/config_mac",
		-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
		-- Must point to the                      Change to one of `linux`, `win` or `mac`
		-- eclipse.jdt.ls installation            Depending on your system.

		-- See `data directory configuration` section in the README
		"-data",
		WORKSPACE_PATH,
	},
	on_attach = require("user.lspconfig").on_attach,

	settings = {
        java = {
            eclipse = {
                downloadSources = true,
            },
            configuration = {
                updateBuildConfiguration = "interactive",
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = false,
            },
            references = {
                includeDecompiledSources = true,
            },
        },
        completion = {
            favoriteStaticMembers = {
                "org.hamcrest.MatcherAssert.assertThat",
                "org.hamcrest.Matchers.*",
                "org.hamcrest.CoreMatchers.*",
                "org.junit.jupiter.api.Assertions.*",
                "java.util.Objects.requireNonNull",
                "java.util.Objects.requireNonNullElse",
            },
        },
        contentProvider = { preferred = "fernflower" },
		extendedClientCapabilities = extendedClientCapabilities,
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
		signatureHelp = { enabled = true },
	},
}
require('jdtls').setup_dap()

vim.cmd "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)"
vim.cmd "command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)"
vim.cmd "command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()"
-- vim.cmd "command! -buffer JdtJol lua require('jdtls').jol()"
vim.cmd "command! -buffer JdtBytecode lua require('jdtls').javap()"
