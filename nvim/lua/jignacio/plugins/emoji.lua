return {
  "allaman/emoji.nvim",
  version = "1.0.0", -- optionally pin to a tag
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function(_, opts)
    require("emoji").setup(opts)
    require("telescope").load_extension("emoji")

    vim.keymap.set(
      {"n"}, "<leader>fe", "<cmd>Telescope emoji<cr>",
      { desc = "[F]ind [e]moji with telescope", silent = true }
    )
  end,
}
