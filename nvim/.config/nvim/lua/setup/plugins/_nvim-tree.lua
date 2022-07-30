require("nvim-tree").setup({
  sort_by = "case_sensitive",
  disable_netrw = true,
  filters = {
    dotfiles = false,
  },
  view = {
    adaptive_size = true,
    hide_root_folder = true,
  },
  renderer = {
    group_empty = true,
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
