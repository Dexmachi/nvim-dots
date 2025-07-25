return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "pyright",
        "flake8",
        "ansible-lint",
        "prettier",
        "shellcheck",
        "shfmt",
        "stylua",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "tailwindcss",
        "bashls",
        "ansiblels",
        "jsonls",
      },
    },
  },
}
