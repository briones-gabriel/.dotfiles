require("nvim-tree").setup({
  sort_by = "case_sensitive",
  disable_netrw = true,
  filters = {
    dotfiles = true,
    custom = { "^.git$" }
  },
  view = {
    adaptive_size = true,
    hide_root_folder = true,
  },
  renderer = {
    group_empty = true,
    root_folder_modifier = ":t",
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
