return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      transparent_background = true,
      term_colors = true,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },

      custom_highlights = function(colors)
        return {
          --          -- 🧱 Base UI
          --          Normal = { fg = "#fba6cd", bg = "NONE" },
          --          NormalNC = { fg = "#fba6cd", bg = "NONE" },
          --          NormalFloat = { fg = "#fba6cd", bg = "NONE" },
          --          FloatBorder = { fg = "#ff7bac", bg = "NONE" },
          --          FloatTitle = { fg = "#ff8ebd", style = { "bold" } },
          --          WinSeparator = { fg = "#ff6fa5" },
          --          LineNr = { fg = "#d38aa4", bg = "NONE" },
          CursorLineNr = { fg = "#f86ea7", style = { "bold" } },
          --          CursorLine = { bg = "NONE" },
          --          CursorColumn = { bg = "NONE" },
          --          ColorColumn = { bg = "NONE" },
          --          Visual = { bg = "#3b1a2d" },
          --          MatchParen = { fg = "#ffd5ec", style = { "bold" } },
          --          Search = { fg = "#1a0e17", bg = "#ff8ebd" },
          --          IncSearch = { fg = "#1a0e17", bg = "#ffc2dc" },
          --
          --          -- 🍬 Menus e popups
          Pmenu = { fg = "#ffd5ec", bg = "NONE" },
          PmenuSel = { fg = "#ff8ebd", bg = "NONE", style = { "underline" } },
          PmenuThumb = { bg = "#ff8ebd" },
          --
          --          -- 🔠 Sintaxe
          Comment = { fg = "#f0a5cb", style = { "italic" } },
          String = { fg = "#ffb6d9" },
          Function = { fg = "#ff70a3", style = { "bold" } },
          Keyword = { fg = "#ffaad3", style = { "bold" } },
          Type = { fg = "#ffc2dc" },
          Identifier = { fg = "#fba6cd" },
          Constant = { fg = "#ffbedd" },
          Statement = { fg = "#ff99c3" },
          Operator = { fg = "#f86ea7" },
          Number = { fg = "#ff85b9" },
          Boolean = { fg = "#ff78ae" },
          --
          --          -- 🌊 Azul como acento
          Title = { fg = "#9dcff9", style = { "bold" } },
          Special = { fg = "#addbff" },
          Directory = { fg = "#a3c8f1" },
          --
          --          -- 🧠 Treesitter
          ["@function"] = { fg = "#ff70a3" },
          ["@keyword"] = { fg = "#ffaad3", style = { "bold" } },
          ["@type"] = { fg = "#ffc2dc" },
          ["@constant"] = { fg = "#ffbedd" },
          ["@variable"] = { fg = "#fba6cd" },
          ["@string"] = { fg = "#ffb6d9" },
          ["@comment"] = { fg = "#f0a5cb", style = { "italic" } },
          ["@boolean"] = { fg = "#ff78ae" },
          ["@number"] = { fg = "#ff85b9" },
          ["@parameter"] = { fg = "#dd95b8" },
          ["@field"] = { fg = "#fba6cd" },
          --
          --          -- 💡 Diagnostics
          DiagnosticError = { fg = "#ff4f88" },
          DiagnosticWarn = { fg = "#ffb4d4" },
          DiagnosticInfo = { fg = "#a3c8f1" },
          DiagnosticHint = { fg = "#cce6ff" },
          DiagnosticUnderlineError = { sp = "#ff4f88", style = { "undercurl" } },
          DiagnosticUnderlineWarn = { sp = "#ffb4d4", style = { "undercurl" } },
          DiagnosticUnderlineInfo = { sp = "#a3c8f1", style = { "undercurl" } },
          DiagnosticUnderlineHint = { sp = "#cce6ff", style = { "undercurl" } },
          --
          --          -- 🔍 Telescope
          --          TelescopeBorder = { fg = "#ff8ebd", bg = "NONE" },
          --          TelescopePromptBorder = { fg = "#ff8ebd", bg = "NONE" },
          --          TelescopeMatching = { fg = "#ffc2dc", style = { "bold" } },
          --          TelescopeSelection = { fg = "#ffb6d9", style = { "bold", "italic" } },
          --
          --          -- 📦 GitSigns
          --          GitSignsAdd = { fg = "#ff95c1" },
          --          GitSignsChange = { fg = "#9dcff9" },
          --          GitSignsDelete = { fg = "#ff4f88" },
          --
          --          -- ⛓️ StatusLine
          StatusLine = { fg = "#ffd1ea", bg = "#1a0e17" },
          StatusLineNC = { fg = "#cfa5b6", bg = "#1a0e17" },
          --
          --          -- ✨ Outros
          --          Todo = { fg = "#ff95c1", bg = "NONE", style = { "bold" } },
        }
      end,
    },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "moon",
      styles = {
        transparency = true,
        italic = true,
        bold = true,
      },
    },
  },

  --  {
  --    "typicode/bg.nvim",
  --    lazy = false,
  --  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
