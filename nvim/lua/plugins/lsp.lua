return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "black",
        "ansible-lint",
        "isort",
        "prettier",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "marksman",
        "tailwindcss",
        "bashls",
        "ansiblels",
        "pyright",
        "jsonls",
        "tsserver",
        "zk",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●", -- ou "" para sem prefixo
          spacing = 2,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      local lspconfig = require("lspconfig")
      lspconfig.marksman.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.zk.setup({})
      lspconfig.bashls.setup({})
      lspconfig.ansiblels.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.pyright.setup({})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
