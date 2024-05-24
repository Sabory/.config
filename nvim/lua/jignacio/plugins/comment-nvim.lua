-- NOTE: Commenter
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("Comment").setup({
      -- ignores empty lines
      ignore = "^$",
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      ---Add aspace b/w comment and the line
      padding = true,
    })
  end,
  dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
}
