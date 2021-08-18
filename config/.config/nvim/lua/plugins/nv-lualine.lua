local present, _ = pcall(require, "lualine")

if not present then
  return
end

require("lualine").setup {
  options = {
    theme = "nightfox",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = { "diff", "filetype" },
    lualine_y = { },
    lualine_z = { }
  },
  extensions = { "nvim-tree" },
}
