return {
  {
    "zk-org/zk-nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      {
        "<leader>Z",
        desc = "Zettelkasten",
      },
      {
        "<leader>Zi",
        ":ZkInsertLink<CR>",
        mode = "n",
        desc = "Inserir um link",
      },
      {
        "<leader>Znn",
        function()
          local zk = require("zk")
          local title = vim.fn.input("title: ")
          if title ~= "" then
            zk.new({ title = title })
          end
        end,
        mode = "n",
        desc = "nova nota zk",
      },
      {
        "<leader>Zf",
        function()
          require("zk").pick_notes()
        end,
        mode = "n",
        desc = "Listar notas",
      },
      {
        "<leader>Zt",
        function()
          require("zk").pick_tags()
        end,
        mode = "n",
        desc = "Tags ZK",
      },
    },

    config = function()
      local zk = require("zk")

      zk.setup({
        picker = "telescope", -- fzf, fzf_lua, etc
        lsp = {
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
            filetypes = { "markdown" },
          },
          auto_attach = {
            enabled = true,
          },
        },
      })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    "Toprun123/PicVim",
    config = function()
      require("picvim").setup()
    end,
  },
}
