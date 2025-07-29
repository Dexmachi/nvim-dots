return {
  {
    "mickael-menu/zk-nvim",
    config = function()
      vim.keymap.set("n", "<leader>zn", function()
        local title = vim.fn.input("Title: ")
        if title ~= "" then
          require("zk").new({ title = title })
        end
      end)

      vim.keymap.set("n", "<leader>zf", "<cmd>ZkNotes sort=modified<CR>")
      vim.keymap.set("n", "<leader>zt", "<cmd>ZkTags<CR>")

      require("zk").setup({
        picker = "telescope", -- ou "fzf"
        lsp = {
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
          },
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
        default = {
          root = "~/diario/",
        },
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
    opts = {},
  },
}
