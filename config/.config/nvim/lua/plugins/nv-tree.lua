local present, _ = pcall(require, "nvim-tree.config")

if not present then
    return
end

g.nvim_tree_gitignore = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_auto_open = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_add_trailing = 1
g.nvim_tree_highlight_opened_files = 2
g.nvim_tree_disable_default_keybindings = 1
g.nvim_tree_lsp_diagnostics = 0
g.nvim_tree_width = 30
g.nvim_tree_follow = 1
g.nvim_tree_allow_resize = 1
g.nvim_tree_auto_ignore_ft = {}
g.nvim_tree_ignore = {".git", "node_modules", "target"}
g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}
g.nvim_tree_icons = {
  default = "",
  --folder = {
  --  default = "",
  --  open = "",
  --  empty = "",
  --  empty_open = "",
  --  symlink = "",
  --  symlink_open = "",
  --},
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
g.nvim_tree_bindings = {
  { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
  { key = "v",                            cb = tree_cb("vsplit") },
  { key = "x",                            cb = tree_cb("split") },
  { key = "<C-b>",                        cb = tree_cb("edit") },
  { key = "<",                            cb = tree_cb("prev_sibling") },
  { key = ">",                            cb = tree_cb("next_sibling") },
  { key = "P",                            cb = tree_cb("parent_node") },
  { key = "<Tab>",                        cb = tree_cb("preview") },
  { key = "K",                            cb = tree_cb("first_sibling") },
  { key = "J",                            cb = tree_cb("last_sibling") },
  { key = "I",                            cb = tree_cb("toggle_ignored") },
  { key = "H",                            cb = tree_cb("toggle_dotfiles") },
  { key = "R",                            cb = tree_cb("refresh") },
  { key = "a",                            cb = tree_cb("create") },
  { key = "d",                            cb = tree_cb("remove") },
  { key = "r",                            cb = tree_cb("rename") },
  { key = "<C-r>",                        cb = tree_cb("full_rename") },
  { key = "x",                            cb = tree_cb("close_node") },
  { key = "y",                            cb = tree_cb("copy_name") },
  { key = "Y",                            cb = tree_cb("copy_path") },
  { key = "gy",                           cb = tree_cb("copy_absolute_path") },
  { key = "q",                            cb = tree_cb("close") },
  { key = "c",                            cb = tree_cb("close") },
}
