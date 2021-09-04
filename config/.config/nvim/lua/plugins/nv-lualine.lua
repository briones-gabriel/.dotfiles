local present, lualine = pcall(require, "lualine")

if not present then
  return
end

local gps = require "plugins.nv-gps"

lualine.setup {
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
      {
        gps.get_location,
        condition = gps.is_available,
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
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
  extensions = { "nvim-tree" },
}
