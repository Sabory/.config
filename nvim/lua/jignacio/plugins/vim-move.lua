-- Move lines and selections up and down with vim-move
return {
  'matze/vim-move',
  event = "BufReadPost",
  config = function()
    vim.g.move_key_modifier = 'A'
    vim.g.move_key_modifier_visualmode = 'A'
  end,
}
