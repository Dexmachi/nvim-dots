return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "rust",
        "java",
        "cpp",
        "rust",
        "go",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },
  { import = "lazyvim.plugins.extras.lang.json" },
}
