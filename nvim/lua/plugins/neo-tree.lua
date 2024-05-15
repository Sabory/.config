return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  event = "VeryLazy",
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        }
      }
    })

    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left toggle<CR>", {})
    vim.keymap.set("n", "<C-g>", ":Neotree git_status reveal left toggle<CR>", {})
  end,
}
