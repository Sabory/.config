return {
	"vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
	vim.keymap.set("n", "<leader>t", ":TestNearest<CR>"),
	vim.keymap.set("n", "<leader>tf", ":TestFile<CR>"),
	vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>"),
	vim.keymap.set("n", "<leader>tl", ":TestLast<CR>"),
  vim.keymap.set("n", "<leader>tz", ":VimuxZoomRunner<CR>"),
  vim.keymap.set("n", "<leader>tc", ":VimuxCloseRunner<CR>"),
  vim.cmd("let test#strategy = 'vimux'"),
  vim.cmd("let g:VimuxUseNearest = 0"),
  vim.cmd("let g:VimuxCloseOnExit = 1"),
}
