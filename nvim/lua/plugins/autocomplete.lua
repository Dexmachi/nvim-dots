return {
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      require("luasnip.loaders.from_lua").lazy_load({
        -- SE TOCA, COLOCA OS SNIPPETS NESSE DIRETÓRIO AQUI EMBAIXO
        -- E NÃO SE ESQUECE, O NOME DO (snippet).lua TEM QUE SER O MESMO DA LINGUAGEM
        paths = { "~/.config/nvim/lua/snippets" },
      })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
