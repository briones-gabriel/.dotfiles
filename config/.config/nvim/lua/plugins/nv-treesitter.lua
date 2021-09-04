local present, treesitter_configs = pcall(require, "nvim-treesitter.configs")

if not present then
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

treesitter_configs.setup {
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
  refactor = {
    highlight_definitions = {
      enable = basic_languages
    },
    highlight_current_scope = {
      enable = false,
    },
    smart_rename = {
      enable = false,
    },
  },
}

-- nvim-treesitter folding
vim.cmd([[
  set foldexpr=nvim_treesitter#foldexpr()
]])
