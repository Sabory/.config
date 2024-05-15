return {
  "ggandor/leap.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
    vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
    vim.keymap.set({'n', 'x', 'o'}, '<C-s>', '<Plug>(leap-from-window)')
  end,
}
