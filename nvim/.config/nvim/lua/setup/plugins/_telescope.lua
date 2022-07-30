require('telescope').setup {
  defaults = {
    sorting_strategy = 'ascending',
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        height = 0.5,
        prompt_position = 'top',
        width = 0.8,
      },
    },
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
    },
  },
  pickers = {
    find_files = {
      previewer = false
    },
    live_grep = {
      previewer = false
    }
  },
}

local is_harpoon_present, _ = pcall(require, 'harpoon')

if is_harpoon_present then
  require('telescope').load_extension('harpoon')
end
