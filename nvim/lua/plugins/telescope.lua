local TR = require("telescope.builtin")
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>fe",
        function()
          TR.lsp_references()
        end,
        desc = "referências LSP",
      },
      {
        "<leader>fk",
        function()
          TR.keymaps()
        end,
        desc = "encontrar keymaps",
      },
      {
        "<leader>fb",
        function()
          TR.buffers()
        end,
        desc = "encontrar buffers",
      },
      {
        "<leader>fh",
        function()
          TR.help_tags()
        end,
        desc = "encontrar ajuda",
      },
      {
        "<leader>fd",
        function()
          TR.diagnostics()
        end,
        desc = "encontrar diagnósticos",
      },
      {
        "<C-r>",
        function()
          TR.lsp_references()
        end,
        desc = "vizualizar referências LSP",
      },
      {
        "<leader>f.",
        function()
          TR.oldfiles({ hidden = true })
        end,
        desc = "encontrar arquivos antigos",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("bookmarks")
    end,
  },
}
