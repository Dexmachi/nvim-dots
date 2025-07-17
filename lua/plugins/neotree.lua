return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- mostra arquivos escondidos
        hide_dotfiles = false, -- não esconder .dotfiles
        hide_gitignored = false, -- opcional: mostrar arquivos ignorados pelo git
      },
    },
  },
}
