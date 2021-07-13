require("nvim-autopairs").setup {
  ts_config       = {lua = {"string"}, javascript = {"template_string"}, java = false},
  check_ts        = true,
  disable_filetype = { "TelescopePrompt" },
}
require("nvim-autopairs.completion.compe").setup {
  map_cr          = true,    ---  map <CR> on insert mode
  map_complete    = true,    --- it will auto insert `(` after select function or method item
}
