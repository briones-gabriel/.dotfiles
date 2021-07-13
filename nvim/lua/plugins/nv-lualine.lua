require("lualine").setup {
  options = {
    theme = "auto",
    lower = true,
  },
  sections = {
    lualine_a = { },
    --lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = { "diff", "filetype" },
    lualine_y = { },
    lualine_z = { }
  },
  extensions = { "nvim-tree" }
}
