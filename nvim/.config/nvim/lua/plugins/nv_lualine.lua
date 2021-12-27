require("lualine").setup {
  options = {
    theme = "auto",
    component_separators = {"", ""},
    section_separators = {"", ""},
  },
  sections = {
    lualine_a = {},
    lualine_b = { "mode" },
    lualine_c = {
      {
        "filename",
        file_status = true,
        path = 0,
        symbols = {
          modified = '',
          readonly = '',
          unnamed = '',
        }
      },
      {
        "diagnostics",
        sources = {"nvim_diagnostic"},
        sections = {"error", "warn"},
        symbols = {error = " ", warn = " "},
        colored = true,
        update_in_insert = false,
        always_visible = false,
      },
    },
    lualine_x = {
      {
        "diff",
        colored = true,
        symbols = {
          added = " ",
          modified = " ",
          removed = " "
        },
      },
      {
        "branch",
        icon = ""
      }
    },
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
