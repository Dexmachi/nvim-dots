return {
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        "<leader>d",
        desc = "debugger",
      },
      {
        "<leader>du",
        function()
          require("dapui").toggle()
        end,
        mode = "n",
        desc = "ativar debugger UI",
      },
    },
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("lazydev").setup({
        library = { "nvim-dap-ui" },
      })
      require("dapui").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "jbyuki/one-small-step-for-vimkind",
    },
    config = function()
      local dap = require("dap")
      dap.adapters.nlua = function(callback, config)
        callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
      end
      dap.configurations.lua = {
        {
          type = "nlua",
          request = "attach",
          name = "Attach to running Neovim instance",
          host = function()
            return "127.0.0.1"
          end,
          port = function()
            return 8086
          end,
        },
      }
    end,
  },
}
