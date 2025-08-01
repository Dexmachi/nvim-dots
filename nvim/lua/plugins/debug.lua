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
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = {
        "python",
        "bash",
        "node2",
        "codelldb",
        "java-debug-adapter",
        "local-lua-debugger-vscode",
      },
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

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Start/Continue Debug",
      },
      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<F12>",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<Leader>r",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<Leader>R",
        function()
          require("dap").set_breakpoint(vim.fn.input("Condition: "))
        end,
        desc = "Conditional Breakpoint",
      },
      {
        "<Leader>rl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last Debug Session",
      },
      {
        "<Leader>ru",
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
      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = {
          vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js",
        },
      }
      dap.configurations.javascript = {
        {
          name = "Launch file",
          type = "node2",
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
          console = "integratedTerminal",
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

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          spacing = 2,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
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
