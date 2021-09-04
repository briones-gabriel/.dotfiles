local present, gitsigns = pcall(require, "gitsigns")

if not present then
  return
end

gitsigns.setup {
  signs = {
    add                  = { hl = "GitAdd"   , text = "▍", numhl = "GitSignsAddNr" },
    change               = { hl = "GitChange", text = "▍", numhl = "GitSignsChangeNr" },
    delete               = { hl = "GitDelete", text = "▍", numhl = "GitSignsDeleteNr" },
    topdelete            = { hl = "GitDelete", text = "▍", numhl = "GitSignsDeleteNr" },
    changedelete         = { hl = "GitChange", text = "▍", numhl = "GitSignsChangeNr" },
  },
  use_internal_diff      = true,
  numhl                  = false,
  linehl                 = false,
  current_line_blame     = false,
  status_formatter       = nil,
  update_debounce        = 100,
  sign_priority          = 1000,
  watch_index            = { interval = 1000 },
}

cmd("hi GitAdd guifg=#8fa867")
cmd("hi GitChange guifg=#ffc66b")
cmd("hi GitDelete guifg=#e74946")
