-- Alternate between source and related files
return {
	{
		"rgroli/other.nvim",
		config = function()
			require("other-nvim").setup({
				mappings = {
					"rails",
					"golang",
					{
						pattern = "/modules/(.+)/(.*).tsx",
						context = "test",
						target = "/modules/%1/%2.test.tsx",
					},
					{
						pattern = "/modules/(.+)/(.*).test.tsx",
						context = "source",
						target = "/modules/%1/%2.tsx",
					},
          -- Mobile-app repo test configs
          {
            pattern = "/screens/(.+)/(.*).tsx",
            context = "test",
            target = "/screens/%1/%2.test.tsx",
          },
          {
            pattern = "/screens/(.+)/(.*).test.tsx",
            context = "source",
            target = "/screens/%1/%2.tsx",
          },
					-- Web-app repo tests config
					{
						pattern = "/pages/(.+)/(.*).tsx",
						context = "test",
						target = "/pages.test/%1/%2.test.tsx",
					},
					{
						pattern = "/pages.test/(.+)/(.*).test.tsx",
						context = "source",
						target = "/pages/%1/%2.tsx",
					},
				},
				keybindings = {
					["<cr>"] = "open_file_by_command()",
					["<esc>"] = "close_window()",
					t = "open_file_tabnew()",
					o = "open_file()",
					q = "close_window()",
					v = "open_file_vs()",
					s = "open_file_sp()",
				},
			})

			vim.api.nvim_set_keymap(
				"n",
				"<leader>oo",
				"<cmd>:Other<CR>",
				{ noremap = true, silent = true, desc = "Alternate between related files" }
			)
		end,
	},
}
