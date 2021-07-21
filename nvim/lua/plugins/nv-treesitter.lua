local present, _ = pcall(require, "nvim-treesitter")
local present_2, _ = pcall(require, "nvim-treesitter.configs")
if not (present or present_2) then
  return
end

require("nvim-treesitter.configs").setup {
  autotag = {
    enable  = true,
  },
  indent = {
    enable  = true,
  },
  autopairs = {
    enable  = true,
  },
  highlight = {
    enable  = true,
  },
}
