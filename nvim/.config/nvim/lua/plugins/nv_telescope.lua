local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup {
  pickers = {
    find_files = {
      previewer = false,
      layout_config = {
        width = 0.75,
        height = 0.75
      },
    },
    live_grep = {
      prompt_title = "Find words",
    },
  },
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["q"] = actions.close
      },
    },
    file_ignore_patterns = { "node_modules/*.*", ".idea/*.*", ".git/.*", "static/*.*", "target/*.*" },
    color_devicons = true,
    use_less = true,
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

telescope.load_extension("fzf")
