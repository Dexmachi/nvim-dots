if true then
  return {}
end -- NOTE remova essa if then para ativar o plugin

return {
  {
    "olimorris/codecompanion.nvim",
    opts = {
      log_level = "DEBUG",
      enable = false,
    },
  },
}
