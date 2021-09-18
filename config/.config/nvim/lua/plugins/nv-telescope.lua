local present, telescope = pcall(require, "telescope")

if not present then
  return
end

local previewers = require "telescope.previewers"
local sorters    = require "telescope.sorters"
local actions    = require "telescope.actions"

local common_picker = {
  theme = "dropdown",
  borderchars = {
    { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
    results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
    preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
  },
  prompt_title = false,
  previewer = false,
  layout_config = {
    mirror = true,
    height = 0.5,
    width  = 0.5
  },
}

telescope.setup {
  pickers = {
    find_files = common_picker,
    live_grep = common_picker,
    git_branches = common_picker,
  },
  defaults = {
    prompt_prefix               = " ",
    selection_caret             = " ",
    entry_prefix                = "  ",
    initial_mode                = "insert",
    selection_strategy          = "reset",
    sorting_strategy            = "ascending",
    layout_strategy             = "center",
    layout_config = {
      horizontal = {},
      vertical = {},
      center = {},
    },
    mappings = {
      i = {
        ["<esc>"]               = actions.close,
        ["<C-j>"]               = actions.move_selection_next,
        ["<C-k>"]               = actions.move_selection_previous,
      },
      n = {
        ["q"]                   = actions.close,
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    file_ignore_patterns        = { "node_modules/.*", ".idea/.*", ".git/.*", "static/.*", "target/.*" },
    path_display                = { "absolute" },
    borderchars                 = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    border                      = {},
    color_devicons              = true,
    use_less                    = true,
    set_env                     = nil,
    winblend                    = 0,
    file_sorter                 = sorters.get_fuzzy_file,
    generic_sorter              = sorters.get_generic_fuzzy_sorter,
    grep_previewer              = previewers.vim_buffer_vimgrep.new,
    qflist_previewer            = previewers.vim_buffer_qflist.new,
    file_previewer              = previewers.vim_buffer_cat.new,
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
