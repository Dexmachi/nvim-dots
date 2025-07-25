return {
  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- não pode ser lazy pra funcionar bem com stdin
    priority = 1000, -- garante que carrega cedo
    config = function()
      local logo = [[
██████╗ ██╗ ██████╗ ███╗   ██╗██╗   ██╗███████╗██╗   ██╗███████╗
██╔══██╗██║██╔═══██╗████╗  ██║╚██╗ ██╔╝██╔════╝██║   ██║██╔════╝
██║  ██║██║██║   ██║██╔██╗ ██║ ╚████╔╝ ███████╗██║   ██║███████╗
██║  ██║██║██║   ██║██║╚██╗██║  ╚██╔╝  ╚════██║██║   ██║╚════██║
██████╔╝██║╚██████╔╝██║ ╚████║   ██║   ███████║╚██████╔╝███████║
╚═════╝ ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝ ╚═════╝ ╚══════╝
                                                                
]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      require("dashboard").setup({
        theme = "doom",
        hide = { statusline = false },
        config = {
          header = vim.split(logo, "\n"),
          center = {
            {
              action = "lua LazyVim.pick()()",
              desc = " Find File",
              icon = " ",
              key = "f",
            },
            {
              action = "ene | startinsert",
              desc = " New File",
              icon = " ",
              key = "n",
            },
            {
              action = 'lua LazyVim.pick("oldfiles")()',
              desc = " Recent Files",
              icon = " ",
              key = "r",
            },
            {
              action = 'lua LazyVim.pick("live_grep")()',
              desc = " Find Text",
              icon = " ",
              key = "g",
            },
            {
              action = "lua LazyVim.pick.config_files()()",
              desc = " Config",
              icon = " ",
              key = "c",
            },
            {
              action = 'lua require("persistence").load()',
              desc = " Restore Session",
              icon = " ",
              key = "s",
            },
            {
              action = "LazyExtras",
              desc = " Lazy Extras",
              icon = " ",
              key = "x",
            },
            {
              action = "Lazy",
              desc = " Lazy",
              icon = "󰒲 ",
              key = "l",
            },
            {
              action = function()
                vim.api.nvim_input("<cmd>qa<cr>")
              end,
              desc = " Quit",
              icon = " ",
              key = "q",
            },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      })

      -- Corrige bug de statusline depois de fechar Lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        enabled = false,
      },
    },
  },
}
