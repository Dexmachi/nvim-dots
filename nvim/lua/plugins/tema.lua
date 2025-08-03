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
          NormalFloat = { fg = "#a3c8f1", bg = "NONE" },
          FloatBorder = { fg = "#9dcff9", bg = "NONE" },
          FloatTitle = { fg = "#ff8ebd", bg = "NONE", style = { "bold" } },
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
          -- 🔲 Janela de autocomplete/documentação
          Pmenu = { fg = "#ff8ebd", bg = "NONE" },
          PmenuSel = { fg = "#9dcff9", bg = "NONE" },
          PmenuThumb = { bg = "#ff8ebd" },

          -- 🔤 Abreviação e origem
          CmpItemAbbr = { fg = "#ffd5ec" },
          CmpItemAbbrMatch = { fg = "#ffb4d4", style = { "bold" } },
          CmpItemAbbrMatchFuzzy = { fg = "#ffb4d4", style = { "italic" } },
          CmpItemMenu = { fg = "#ff8ebd", style = { "italic" } },

          -- 🧠 Tipos genéricos e por ícone
          CmpItemKind = { fg = "#9dcff9", style = { "bold" } },
          CmpItemKindText = { fg = "#ffd5ec" },
          CmpItemKindMethod = { fg = "#ff70a3" },
          CmpItemKindFunction = { fg = "#ff70a3" },
          CmpItemKindConstructor = { fg = "#ff70a3" },
          CmpItemKindField = { fg = "#fba6cd" },
          CmpItemKindVariable = { fg = "#fba6cd" },
          CmpItemKindClass = { fg = "#ffc2dc" },
          CmpItemKindInterface = { fg = "#ffc2dc" },
          CmpItemKindModule = { fg = "#addbff" },
          CmpItemKindProperty = { fg = "#fba6cd" },
          CmpItemKindUnit = { fg = "#ffaad3" },
          CmpItemKindValue = { fg = "#ff85b9" },
          CmpItemKindEnum = { fg = "#ff99c3" },
          CmpItemKindKeyword = { fg = "#ffaad3" },
          CmpItemKindSnippet = { fg = "#f0a5cb" },
          CmpItemKindColor = { fg = "#f0a5cb" },
          CmpItemKindFile = { fg = "#a3c8f1" },
          CmpItemKindReference = { fg = "#9dcff9" },
          CmpItemKindFolder = { fg = "#a3c8f1" },
          CmpItemKindEnumMember = { fg = "#ff99c3" },
          CmpItemKindConstant = { fg = "#ffbedd" },
          CmpItemKindStruct = { fg = "#ffc2dc" },
          CmpItemKindEvent = { fg = "#ff85b9" },
          CmpItemKindOperator = { fg = "#f86ea7" },
          CmpItemKindTypeParameter = { fg = "#ffc2dc" },

          -- 🤖 Para IA (Copilot, etc)
          CmpItemKindCopilot = { fg = "#ff8ebd" },
          CmpItemKindAI = { fg = "#f0a5cb", style = { "italic" } },
          --
          -- 🔠 Sintaxe
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
          --           -- 💡 Diagnostics
          -- DiagnosticError = { fg = "#ff4f88" },
          -- DiagnosticWarn = { fg = "#f5e36c" },
          -- DiagnosticInfo = { fg = "#6cf56c" },
          -- DiagnosticHint = { fg = "#cce6ff" },
          DiagnosticUnderlineError = { sp = "#ff4f88", style = { "underdouble", "italic" } },
          DiagnosticUnderlineWarn = { sp = "#ffb4d4", style = { "undercurl", "italic" } },
          DiagnosticUnderlineInfo = { sp = "#a3c8f1", style = { "undercurl", "italic" } },
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
          Hack = { fg = "#f79e45", bg = "NONE", style = { "bold" } },
          Hint = { fg = "#cce6ff", bg = "NONE", style = { "italic" } },
          Warn = { fg = "#f5e36c", bg = "NONE", style = { "bold" } },
          Fix = { fg = "#ff4f88", bg = "NONE", style = { "bold" } },
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
