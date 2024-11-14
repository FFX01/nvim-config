return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.opt.signcolumn = "yes"

		local lspconfig_defaults = require("lspconfig").util.default_config

		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			"force",
			lspconfig_defaults.capabilities,
			require("cmp_nvim_lsp").default_capabilities()
		)

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>FzfLua lsp_references<cr>", opts)
				vim.keymap.set("n", "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end,
		})

		require("lspconfig").pylsp.setup({
			settings = {
				pylsp = {
					plugins = {
						configurationSources = { "flake8" },
						flake8 = { enabled = true, config = os.getenv("PWD") .. "/flake8" },
                        autopep8 = { enabled = false },
                        pycodestyle = { enabled = false },
                        pyflakes = { enabled = false },
                        pylint = { enabled = false },
						pylsp_mypy = {
							enabled = true,
						},
					},
				},
			},
		})

		require("lspconfig").ts_ls.setup({
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = os.getenv("HOME") .. "/.nvm/versions/node/v20.16.0/bin/vue-language-server",
						languages = { "vue" },
					},
				},
			},
		})

		require("lspconfig").volar.setup({
			init_options = {
				vue = {
					hybridMode = false,
				},
			},
		})

		local basic_servers = { "html", "cssls", "eslint" }
		for _, s in ipairs(basic_servers) do
			require("lspconfig")[s].setup({})
		end

		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {
							"vim",
							"require",
						},
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})

		require("lspconfig").clangd.setup({
			cmd = { "/opt/homebrew/opt/llvm/bin/clangd" },
		})

        require("lspconfig").zls.setup({})
	end,
}
