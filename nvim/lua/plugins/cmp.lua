return {
  {
    -- Desativa o blink.cmp explicitamente
    "saghen/blink.cmp",
    enabled = false,
    optional = true,
  },

  {
    -- nvim-cmp configurado manualmente
    "hrsh7th/nvim-cmp",
    main = "lazyvim.util.cmp", -- importante para LazyVim integrar corretamente
    enabled = true,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind-nvim",
      "zbirenbaum/copilot-cmp",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local util = require("lazyvim.util")
      local auto_select = true

      vim.g.copilot_no_tab_map = true

      require("copilot_cmp").setup()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = util.cmp.confirm({ select = auto_select }),
          ["<C-y>"] = util.cmp.confirm({ select = true }),
          ["<S-CR>"] = util.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
          ["<Tab>"] = function(fallback)
            return util.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
          end,
        }),
        sources = cmp.config.sources({
          { name = "copilot", group_index = 1 },
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "nvim_lua" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            symbol_map = { Copilot = "" },
          }),
        },
        window = {
          completion = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
          }),
          documentation = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
          }),
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
      })

      -- Cmdline config
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
      })
    end,
  },
}
