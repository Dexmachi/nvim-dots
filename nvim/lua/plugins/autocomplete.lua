return {
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      require("luasnip.loaders.from_lua").lazy_load({
        paths = { "~/.config/nvim/lua/snippets" },
      })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
