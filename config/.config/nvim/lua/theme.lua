local present, _ = pcall(require, "nord")

if not present then
  return
end

g.nord_contrast                  = false
g.nord_borders                   = true
g.nord_disable_background        = false
g.nord_cursorline_transparent    = false
g.nord_enable_sidebar_background = false

require("nord").set()

vim.cmd([[
    syntax on
    filetype on
    filetype plugin indent on
]])
