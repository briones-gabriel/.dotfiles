local present, _ = pcall(require, "nightfox")

if not present then
  return
end

--g.nord_contrast                  = false
--g.nord_borders                   = true
--g.nord_disable_background        = false
--g.nord_cursorline_transparent    = false
--g.nord_enable_sidebar_background = false

--require("nord").set()

g.nightfox_style = "nordfox"
g.nightfox_terminal_colors = true
g.nightfox_italic_comments = true
g.nightfox_italic_functions = false
g.nightfox_italic_keywords = false
g.nightfox_italic_strings = false
g.nightfox_italic_variables = false
--g.nightfox_color_delimiter = "red"
--g.nightfox_colors = {}

require('nightfox').set()

vim.cmd([[
  syntax on
  filetype on
  filetype plugin indent on
  hi NvimTreeVertSplit guifg=bg
]])
