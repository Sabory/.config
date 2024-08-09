return {
	"nvimtools/none-ls.nvim",
	event = "BufReadPre",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.shfmt,

				null_ls.builtins.formatting.rubocop,
				null_ls.builtins.diagnostics.rubocop,

				null_ls.builtins.diagnostics.zsh,
				null_ls.builtins.diagnostics.commitlint,

				null_ls.builtins.diagnostics.codespell,

				require("none-ls.diagnostics.eslint_d"),
				require("none-ls.formatting.eslint_d"),
				require("none-ls.code_actions.eslint_d"),

				null_ls.builtins.diagnostics.stylelint,
				null_ls.builtins.formatting.stylelint,

        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.golines,
			},
		})
	end,
}
