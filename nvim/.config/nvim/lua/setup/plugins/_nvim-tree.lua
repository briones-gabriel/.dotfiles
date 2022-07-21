require("nvim-tree").setup({
  sort_by = "case_sensitive",
  disable_netrw = true,
  filters = {
    dotfiles = false,
  },
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
    add_trailing = true,
    indent_markers = {
      enable = true,
    },
    icons = {
      git_placement = 'after',
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = true,
      },
    }
  },
})
