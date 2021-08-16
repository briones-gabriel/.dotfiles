local autopairs, _ = pcall(require, "nvim-autopairs")

if not autopairs then
  return
end

local npairs = require "nvim-autopairs"
_G.MUtils= {}

npairs.setup {
  ts_config       = {
    lua = {"string"},
    javascript = {"template_string"},
    java = false
  },
  check_ts        = true,
  disable_filetype = { "TelescopePrompt" },
}

MUtils.completion_confirm = function()
  if vim.fn.pumvisible() ~= 0  then
    return npairs.esc("<CR>")
  else
    return npairs.autopairs_cr()
  end
end

map('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
