require("toggleterm").setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 12
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'horizontal', -- | 'horizontal' | 'window' | 'float',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'single',
    width = 80,
    height = 2,
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
