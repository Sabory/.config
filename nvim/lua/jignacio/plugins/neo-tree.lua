return {
	"nvi -neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	event = "VeryLazy",
	config = function()
		require("neo-tree").setup({
      popup_border_style = "rounded",
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
        follow_current_file = {
          enabled = true,
        },
				window = {
					fuzzy_finder_mappings = {
						["<down>"] = "move_cursor_down",
						["<C-n>"] = "move_cursor_down",
						["<up>"] = "move_cursor_up",
						["<C-p>"] = "move_cursor_up",
					},
				},
        git_status = {
          window = {
            mappings = {
              ["gA"]  = "git_add_all",
            }
          }
        },
			},
			window = {
				mappings = {
					-- Opening files
					["h"] = "open_split",
					["v"] = "open_vsplit",
					["t"] = "open_tabnew",
					-- Nodes navigation
					["zc"] = "close_node",
					["zC"] = "close_all_nodes",
					["zO"] = "expand_all_nodes",
				},
			},
		})

    vim.keymap.set("n", "<leader>ee", ":Neotree last focus left<CR>", { desc = "[E]xplore [E]xpand with last"})
		vim.keymap.set("n", "<leader>ef", ":Neotree filesystem focus left<CR>", { desc = "[E]xplore focus [F]ilesystem"})
    vim.keymap.set("n", "<leader>eg", ":Neotree git_status focus left<CR>", { desc = "[E]xplore focus [G]it status"})
    vim.keymap.set("n", "<leader>ec", ":Neotree close left<CR>", { desc = "[E]xplore [C]lose"})
	end,
}
