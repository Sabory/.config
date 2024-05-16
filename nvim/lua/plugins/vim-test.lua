return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  vim.keymap.set("n", "<leader>rn", ":TestNearest<CR>", { desc = "[R]un [N]earest test" }),
  vim.keymap.set("n", "<leader>rf", ":TestFile<CR>", { desc = "[R]un [F]ile tests" }),
  vim.keymap.set("n", "<leader>rs", ":TestSuite<CR>", { desc = "[R]un [S]uite tests" }),
  vim.keymap.set("n", "<leader>rl", ":TestLast<CR>", { desc = "[R]un [L]ast test" }),
  vim.keymap.set("n", "<leader>rz", ":VimuxZoomRunner<CR>" , { desc = "[R]unner [Z]oom" }),
  vim.keymap.set("n", "<leader>rc", ":VimuxCloseRunner<CR>", { desc = "[R]unner [C]lose" }),
  vim.cmd("let test#strategy = 'vimux'"),
  vim.cmd("let g:VimuxUseNearest = 0"),
  vim.cmd("let g:VimuxCloseOnExit = 1"),
}
