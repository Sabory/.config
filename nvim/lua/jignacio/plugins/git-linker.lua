return {
	"ruifm/gitlinker.nvim",
	event = "VeryLazy",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("gitlinker").setup({ mappings = nil })

		vim.api.nvim_set_keymap(
			"n",
			"<leader>gl",
			'<cmd>lua require"gitlinker".get_buf_range_url("n", {})<cr>',
			{ desc = "[G]it perma[L]ink for line", silent = true }
		)
		vim.api.nvim_set_keymap(
			"v",
			"<leader>gl",
			'<cmd>lua require"gitlinker".get_buf_range_url("v", {})<cr>',
			{ desc = "[G]it perma[L]ink for selected lines", silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>glo",
			'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
			{ desc = "[G]it perma[L]ink for line and [O]pen", silent = true }
		)
		vim.api.nvim_set_keymap(
			"v",
			"<leader>glo",
			'<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
			{ desc = "[G]it perma[L]ink for selected lines and [O]pen", silent = true }
		)
	end,
}
