--FIX:if true then
--FIX:  return {}
--FIX:end
--NOTE: remova essa if then para ativar o plugin

return {
  {
    "olimorris/codecompanion.nvim",
    keys = {
      {
        "<leader>a",
        mode = { "n", "v" },
        desc = "IA codecompanion",
      },
      {
        "<leader>aa",
        ":CodeCompanionActions<CR>",
        mode = { "n", "v" },
        desc = "IA helper",
      },
    },
    opts = {
      log_level = "DEBUG",
      enable = false,
    },
  },
}
