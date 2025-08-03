return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      require("todo-comments").setup({
        keywords = {
          HACK = {
            icon = " ",
            color = "hack",
            alt = {},
          },
        },
        colors = {
          hack = { "Hack", "#ff9edc" },
          warn = { "Warn", "#f5e36c" },
          fix = { "Fix", "#ff4f88" },
          info = { "Info", "#6cf56c" },
        },
      })
    end,
  },
}
