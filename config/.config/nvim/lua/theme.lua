local present, _ = pcall(require, "nightfox")

if not present then
  return
end

local nightfox = require "nightfox"

nightfox.setup({
  fox = "nordfox",
  transparent = true,
  colors = {},
  hlgroup = {},
  styles = {
    comments = "italic",
    keywods = "bold",
    functions = "bold",
  },
})

nightfox.load()

vim.cmd([[
  syntax on
  filetype on
  filetype plugin indent on
  hi NvimTreeVertSplit guifg=bg
]])
