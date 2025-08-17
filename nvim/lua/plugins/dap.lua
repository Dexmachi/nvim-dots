local daps = { "python", "js-debug-adapter", "bash", "codelldb", "java-debug-adapter", "local-lua-debugger-vscode" }

return {
  --INFO: DAPs

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = daps,
      automatic_setup = true,
    },
    config = function(_, opts)
      mason_dap = require("mason-nvim-dap")
      mason_dap.setup(opts)
      if mason_dap.setup_handlers then
        mason_dap.setup_handlers({})
      end
    end,
  },

  --INFO: DAP configs

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      {
        "<C-e>c",
        function()
          require("dap").continue()
        end,
        desc = "Start/Continue Debug",
      },
      {
        "<C-e>o",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<C-e>i",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<C-e>O",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<C-e>s",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<C-e>S",
        function()
          require("dap").set_breakpoint(vim.fn.input("Condition: "))
        end,
        desc = "Conditional Breakpoint",
      },
      {
        "<C-e>l",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last Debug Session",
      },
      {
        "<C-e>r",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle DAP UI",
      },
      {
        "<Leader>rc",
        function()
          require("dap").clear_breakpoints()
        end,
        desc = "Clear All Breakpoints",
      },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      --NOTE: setups
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      --TODO: Modularizar configuração de DAPs

      --NOTE: adapters and configurations python
      dap.adapters.python = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
        args = { "-m", "debugpy.adapter" },
      }
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            return vim.fn.exepath("python3") or "python"
          end,
        },
      }

      --NOTE: adapters and configurations javascript e typescript
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = 8123,
        executable = {
          command = "node",
          args = {
            vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "8123",
          },
        },
      }

      dap.configurations.javascript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          runtimeExecutable = "node",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = vim.fn.getcwd(),
        },
      }

      dap.configurations.typescript = dap.configurations.javascript

      --NOTE: adapters and configurations C, Cpp e rust
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.rust = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      dap.configurations.cpp = dap.configurations.rust
      dap.configurations.c = dap.configurations.rust

      --NOTE: adapters and configurations ansible
      dap.adapters.ansible = {
        type = "executable",
        command = "python", -- or "/path/to/virtualenv/bin/python",
        args = { "-m", "ansibug", "dap" },
      }
      local ansibug_configurations = {
        {
          type = "ansible",
          request = "launch",
          name = "Debug playbook",
          playbook = "${file}",
        },
      }
      dap.configurations["yaml.ansible"] = ansibug_configurations

      --NOTE: adapters and configurations lua
      local mason_path = vim.fn.stdpath("data") .. "/mason/packages/local-lua-debugger-vscode"

      dap.adapters["local-lua"] = {
        type = "executable",
        command = "node",
        args = {
          mason_path .. "/extension/extension/debugAdapter.js",
        },
        enrich_config = function(config, on_config)
          if not config["extensionPath"] then
            local c = vim.deepcopy(config)
            c.extensionPath = mason_path .. "/"
            on_config(c)
          else
            on_config(config)
          end
        end,
      }
      dap.configurations.lua = {
        {
          type = "local-lua",
          request = "launch",
          name = "Debug com lldebugger",
          program = function()
            return vim.fn.input("Arquivo Lua: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = true,
        },
      }

      --NOTE: adapters and configurations Bash
      dap.adapters.bashdb = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
        name = "bashdb",
      }
      dap.configurations.sh = {
        {
          type = "bashdb",
          request = "launch",
          name = "Launch file",
          showDebugOutput = true,
          pathBashdb = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
          pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
          trace = true,
          file = "${file}",
          program = "${file}",
          cwd = "${workspaceFolder}",
          pathCat = "cat",
          pathBash = "/bin/bash",
          pathMkfifo = "mkfifo",
          pathPkill = "pkill",
          args = {},
          argsString = "",
          env = {},
          terminalKind = "integrated",
        },
      }
    end,
  },
}
