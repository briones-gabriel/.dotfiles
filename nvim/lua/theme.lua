local present, _ = pcall(require, "base16-colorscheme")

if present then
  cmd("colorscheme base16-nord")
end

vim.cmd([[
    syntax on
    filetype on
    filetype plugin indent on
]])
