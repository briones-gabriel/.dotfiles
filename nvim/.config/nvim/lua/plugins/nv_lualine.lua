require("lualine").setup {
  options = {
    theme = "nightfox",
    component_separators = {"", ""},
    section_separators = {"", ""},
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { },
    lualine_c = {
      {
        "filename",
        file_status = true,
        path = 0
      },
    },
    lualine_x = { "diff", "branch" },
    lualine_y = { },
    lualine_z = { }
  },
  inactive_sections = {
    lualine_a = { },
    lualine_b = { },
    lualine_c = { },
    lualine_x = { },
    lualine_y = { },
    lualine_z = { }
  },
  extensions = { "nvim-tree" },
}
