return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>ea", "<cmd>AerialToggle<cr>", desc = "[E]xplore with [A]erialToggle" },
	},
	config = function()
		require("aerial").setup({
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        vim.keymap.set("n", "<leader>fa", "<cmd>Telescope aerial<CR>", {
          desc = "Telescope [f]ind with [a]erial", silent = true
        })
			end,
		})

		-- Define a custom command to open aerial with telescope
		require("telescope").load_extension("aerial")
	end,
}
