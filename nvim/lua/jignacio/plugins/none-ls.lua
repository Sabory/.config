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
				require("none-ls.diagnostics.eslint_d"),
			},
		})
	end,
}
