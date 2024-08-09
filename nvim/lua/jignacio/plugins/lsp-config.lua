return {
	{
		"nvim-lua/lsp-status.nvim",
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				text = {
					spinner = "pipe",
					done = "✔",
					commenced = "Started",
					completed = "Completed",
				},
				align = {
					bottom = true,
					right = true,
				},
				window = {
					relative = "win",
					blend = 0,
					zindex = nil,
					border = "none",
				},
			})
		end,
		tag = "legacy",
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"tsserver",
					"html",
					"cssls",
					"gopls",
					"ruby_lsp",
					"pyright",
					"graphql",
					"jsonls",
					"bashls",
					"lua_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local lspconfig = require("lspconfig")

			local mason_lspconfig = require("mason-lspconfig")

			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Change the Diagnostic symbols in the sign column (gutter)
			-- (not in youtube nvim video)
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			mason_lspconfig.setup_handlers({
				--default handler for installed servers
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				-- custom handler for servers that need extra configurations
				["graphql"] = function()
					-- configure graphql language server
					lspconfig["graphql"].setup({
						capabilities = capabilities,
						filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
					})
				end,
				["lua_ls"] = function()
					-- configure lua server (with special settings)
					lspconfig["lua_ls"].setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								-- make the language server recognize "vim" global
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,
			})

			-- Set up the LSP attach autocmd with the keybindings
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }

					opts.desc = "LSP [F]ind: [r]eferences"
					vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<CR>", opts)

					opts.desc = "[L]SP go to [d]eclaration"
					vim.keymap.set("n", "<leader>ld", vim.lsp.buf.declaration, opts)

					opts.desc = "LSP [F]ind: [d]efinitions"
					vim.keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_definitions<CR>", opts)

					opts.desc = "[L]SP [h]over"
					vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts)

					opts.desc = "LSP [F]ind: [i]mplementation"
					vim.keymap.set("n", "<leader>fi", "<cmd>Telescope lsp_implementations<CR>", opts)

					opts.desc = "LSP [F]ind: [t]ype definition"
					vim.keymap.set("n", "<leader>ft", "<cmd>Telescope lsp_type_definitions<CR>", opts)

					opts.desc = "LPS [F]ind: buffer diagnostic[s]"
					vim.keymap.set("n", "<leader>fS", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

					opts.desc = "[L]SP line diagnostic[s]"
					vim.keymap.set("n", "<leader>ls", vim.diagnostic.open_float, opts)

					opts.desc = "LSP [R]efactor: [r]ename"
					vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts)

					opts.desc = "LPS [R]efactor: [f]ormat"
					vim.keymap.set("n", "<leader>rf", function()
						vim.lsp.buf.format({ async = true })
					end, opts)

					opts.desc = "[L]SP code [A]ction"
					vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

					opts.desc = "[L]SP [R]estart"
					vim.keymap.set("n", "<leader>lc", ":LspRestart<CR>", opts)
				end,
			})
		end,
	},
}
