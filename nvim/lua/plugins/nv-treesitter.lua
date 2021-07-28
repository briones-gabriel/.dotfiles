local present, _ = pcall(require, "nvim-treesitter")
local present_2, _ = pcall(require, "nvim-treesitter.configs")

if not (present or present_2) then
  return
end

local basic_languages = {
  "html",
  "vue",
  "javascript",
  "typescript",
  "css",
  "scss",
  "java",
  "sql",
  "lua",
  "php",
  "json",
  "jsdoc",
  "comment",
  "bash",
  "tsx"
}

require("nvim-treesitter.configs").setup {
  autotag = {
    enable  = { "html", "vue" },
  },
  indent = {
    enable  = basic_languages,
  },
  autopairs = {
    enable  = basic_languages,
  },
  highlight = {
    enable  = basic_languages,
  },
}

-- nvim-treesitter folding
vim.cmd([[
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
]])
