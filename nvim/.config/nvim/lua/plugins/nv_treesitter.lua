require("nvim-treesitter.configs").setup {
  autotag = {
    enable  = { "html", "vue" },
  },
  indent = {
    enable  = false,
  },
  autopairs = {
    enable  = true,
  },
  highlight = {
    enable  = true,
    use_languagetree = true,
  },
  refactor = {
    highlight_definitions = {
      enable = true
    },
    highlight_current_scope = {
      enable = false,
    },
    smart_rename = {
      enable = true,
    },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

-- nvim-treesitter folding
vim.cmd([[
  set foldexpr=nvim_treesitter#foldexpr()
]])
