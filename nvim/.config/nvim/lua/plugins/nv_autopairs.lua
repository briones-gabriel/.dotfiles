require("nvim-autopairs").setup {
  ts_config       = {
    lua = {"string"},
    javascript = {"template_string"},
    java = false
  },
  check_ts        = true,
  disable_filetype = { "TelescopePrompt" },
}
