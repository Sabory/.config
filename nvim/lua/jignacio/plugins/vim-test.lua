return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  vim.keymap.set("n", "<leader>Tn", ":TestNearest<CR>", { desc = "[T]est run [N]earest" }),
  vim.keymap.set("n", "<leader>Tf", ":TestFile<CR>", { desc = "[T]est run [F]ile" }),
  vim.keymap.set("n", "<leader>Ts", ":TestSuite<CR>", { desc = "[T]est [S]uite" }),
  vim.keymap.set("n", "<leader>Tl", ":TestLast<CR>", { desc = "[T]est [L]ast" }),
  vim.keymap.set("n", "<leader>Tz", ":VimuxZoomRunner<CR>" , { desc = "[T]est [Z]oom" }),
  vim.keymap.set("n", "<leader>Tc", ":VimuxCloseRunner<CR>", { desc = "[T]est [C]lose" }),

  vim.cmd("let test#strategy = 'vimux'"),
  vim.cmd("let g:VimuxUseNearest = 0"),
  vim.cmd("let g:VimuxCloseOnExit = 1"),
}
