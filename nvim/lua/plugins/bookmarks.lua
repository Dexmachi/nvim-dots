return {
  {
    "tomasky/bookmarks.nvim",
    event = "VimEnter",
    keys = {
      {
        "<leader>tl",
        ":Telescope bookmarks list<CR>",
        desc = "List Bookmarks",
      },
    },
    config = function()
      require("bookmarks").setup({
        save_file = vim.fn.expand("$HOME/.bookmarks"),
        keywords = {
          ["@t"] = "☑️ ",
          ["@w"] = "⚠️ ",
          ["@f"] = "⛏ ",
          ["@n"] = " ",
        },
        on_attach = function(bufnr)
          local bm = require("bookmarks")
          local map = vim.keymap.set
          map("n", "mm", bm.bookmark_toggle)
          map("n", "mi", bm.bookmark_ann)
          map("n", "mc", bm.bookmark_clean)
          map("n", "mn", bm.bookmark_next)
          map("n", "mp", bm.bookmark_prev)
          map("n", "ml", bm.bookmark_list)
          map("n", "mx", bm.bookmark_clear_all)
        end,
      })
    end,
  },
}
