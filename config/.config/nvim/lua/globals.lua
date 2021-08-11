--- VARIABLES ---
_G.PATH       = vim.fn.stdpath("config")
_G.DATA_PATH  = vim.fn.stdpath "data"
_G.opts       = { noremap = true, silent = true, expr = false }
_G.opt        = vim.opt
_G.cmd        = vim.cmd
_G.fn         = vim.fn
_G.g          = vim.g

--- FUNCTIONS ---
_G.map = function (mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

_G.borders = {
  {"╭", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╮", "FloatBorder"},
  {"│", "FloatBorder"},
  {"╯", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╰", "FloatBorder"},
  {"│", "FloatBorder"},
}
