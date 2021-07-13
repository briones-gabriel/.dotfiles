--- VARIABLES ---
_G.PATH       = vim.fn.stdpath("config")
_G.DATA_PATH = vim.fn.stdpath "data"
_G.opts       = { noremap = true, silent = true, expr = false }
_G.optns      = { noremap = true, silent = true }
_G.opt        = vim.opt
_G.g          = vim.g
_G.cmd        = vim.cmd
_G.fn         = vim.fn

--- FUNCTIONS ---
_G.map = function (mode, keybinding, action)
  vim.api.nvim_set_keymap(mode, keybinding, action, opts)
end

_G.cmap = function (mode, keybinding, action, custom_opts)
  vim.api.nvim_set_keymap(mode, keybinding, action, custom_opts)
end

_G.bmap = function(...)
  vim.api.nvim_buf_set_keymap(...)
end

_G.sdef = function (...)
  fn.sign_define(...)
end
