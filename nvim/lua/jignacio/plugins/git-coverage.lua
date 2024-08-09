return {
	"andythigpen/nvim-coverage",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		require("coverage").setup({
			commands = true, -- create commands
			highlights = {
				-- customize highlight groups created by the plugin
				covered = { fg = "#C3E88D" }, -- supports style, fg, bg, sp (see :h highlight-gui)
				uncovered = { fg = "#F07178" },
			},
			signs = {
				-- use your own highlight groups or text markers
				covered = { hl = "CoverageCovered", text = "▎" },
				uncovered = { hl = "CoverageUncovered", text = "▎" },
			},
			summary = {
				-- customize the summary pop-up
				min_coverage = 95.0, -- minimum coverage threshold (used for highlighting)
			},
			lang = {
				-- customize language specific settings
			},
			load_coverage_cb = function(ftype)
				vim.notify("Loaded " .. ftype .. " coverage")
			end,
		})

    vim.api.nvim_set_keymap(
      "n",
      "<leader>cs",
      "<CMD>Coverage<CR>",
      { noremap = true, silent = true, desc = "[C]overage load and show" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>ct",
      "<CMD>CoverageToggle<CR>",
      { noremap = true, silent = true, desc = "[C]overage toggle" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>cc",
      "<CMD>CoverageClear<CR>",
      { noremap = true, silent = true, desc = "[C]overage clear" }
    )
	end,
}
