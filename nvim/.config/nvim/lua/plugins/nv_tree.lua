vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_highlight_opened_files = 2
vim.g.nvim_tree_create_in_closed_folder = 1
vim.g.nvim_tree_auto_ignore_ft = {}
vim.g.nvim_tree_ignore = {".git", "node_modules"}
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}
vim.g.nvim_tree_icons = {
  default = "",
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
}

local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = { ".gitignore" }
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = true,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {
        { key = {"<CR>", "o"}, cb = tree_cb("edit") },
        { key = "<C-v>",       cb = tree_cb("vsplit") },
        { key = "<C-x>",       cb = tree_cb("split") },
        { key = "<C-b>",       cb = tree_cb("edit") },
        { key = "I",           cb = tree_cb("toggle_ignored") },
        { key = "H",           cb = tree_cb("toggle_dotfiles") },
        { key = "R",           cb = tree_cb("refresh") },
        { key = "a",           cb = tree_cb("create") },
        { key = "d",           cb = tree_cb("remove") },
        { key = "r",           cb = tree_cb("rename") },
        { key = "x",           cb = tree_cb("close_node") },
        { key = "y",           cb = tree_cb("copy_name") },
        { key = "Y",           cb = tree_cb("copy_path") },
        { key = "q",           cb = tree_cb("close") },
      }
    }
  }
}
