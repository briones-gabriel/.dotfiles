require('nvim-treesitter.configs').setup {
  autotag = {
    enable  = { 'html', 'vue' },
  },
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
    highlight_current_scope = {
      enable = false,
    },
    smart_rename = {
      enable = false,
    },
  },
}
