require("gitsigns").setup {
  signs = {
    add                  = { hl = "GitAdd"   , text = "▍", numhl = "GitSignsAddNr" },
    change               = { hl = "GitChange", text = "▍", numhl = "GitSignsChangeNr" },
    delete               = { hl = "GitDelete", text = "▍", numhl = "GitSignsDeleteNr" },
    topdelete            = { hl = "GitDelete", text = "▍", numhl = "GitSignsDeleteNr" },
    changedelete         = { hl = "GitChange", text = "▍", numhl = "GitSignsChangeNr" },
  },
  attach_to_untracked    = true,
  signcolumn            = true,
  word_diff              = false,
  numhl                  = false,
  linehl                 = false,
  current_line_blame     = false,
  status_formatter       = nil,
  update_debounce        = 100,
  sign_priority          = 1000,
  max_file_length        = 40000,
  current_line_blame_opts = {
  virt_text = true,
  virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
  delay = 1000,
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  preview_config = {
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
}

vim.cmd("hi GitAdd guifg=#8fa867")
vim.cmd("hi GitChange guifg=#ffc66b")
vim.cmd("hi GitDelete guifg=#e74946")
