local present, gps = pcall(require, "nvim-gps")

if not present then
  return
end

gps.setup({
  icons = {
    ["class-name"] = " ",
    ["function-name"] = " ",
    ["method-name"] = " "
  },
  languages = {},
  separator = "  ",
})

return gps
