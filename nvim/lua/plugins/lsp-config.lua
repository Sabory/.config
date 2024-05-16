return {
  {
    "nvim-lua/lsp-status.nvim",
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({
        text = {
          spinner = "pipe",
          done = "✔",
          commenced = "Started",
          completed = "Completed",
        },
        align = {
          bottom = true,
          right = true,
        },
        window = {
          relative = "win",
          blend = 0,
          zindex = nil,
          border = "none",
        },
      })
    end,
    tag = "legacy",
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    build = ":MasonUpdate",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.graphql.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities,
      })

      local opts = {}

      vim.keymap.set("n", "<leader>ld", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "<leader>lD", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, opts)
      vim.keymap.set("n", "<leader>lf", function()
        vim.lsp.buf.format({ async = true })
      end, opts)

      vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
    end,
  },
}
