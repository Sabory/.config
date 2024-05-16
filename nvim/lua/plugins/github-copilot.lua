return {
  -- copilot suggest something to proof you a working
  "github/copilot.vim",
  event = { "InsertEnter", "BufReadPost" },
  config = function()
    vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })
    vim.g.copilot_no_tab_map = true
    vim.keymap.set("i", "<C-S-J>", "<Plug>(copilot-accept-line)")
    vim.keymap.set("i", "<C-k>", "<Plug>(copilot-dismiss)")
    vim.keymap.set("i", "<C-h>", "<Plug>(copilot-previous)")
    vim.keymap.set("i", "<C-l>", "<Plug>(copilot-next)")
  end,
}
