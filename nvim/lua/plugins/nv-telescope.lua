local present, _ = pcall(require, "telescope")
local present_2, _ = pcall(require, "telescope.actions")
if not (present or present_2) then
  return
end

local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    prompt_prefix               = " ",
    selection_caret             = " ",
    entry_prefix                = "  ",
    initial_mode                = "insert",
    selection_strategy          = "reset",
    sorting_strategy            = "descending",
    layout_strategy             = "vertical",
    mappings = {
      i = {
        ["<esc>"]               = actions.close,
        ["<C-j>"]               = actions.move_selection_next,
        ["<C-k>"]               = actions.move_selection_previous,
        ["<CR>"]                = actions.file_tab,
      },
      n = {
        ["q"]                   = actions.close,
      },
    },
    layout_config = {
      horizontal = { mirror = false },
      vertical = {
        mirror = false,
        height = 0.5,
        width  = 0.5,
      }
    },
    file_sorter                 = require"telescope.sorters".get_fuzzy_file,
    file_ignore_patterns        = { "node_modules/.*", ".idea/.*", ".git/.*", "%.env" },
    generic_sorter              = require"telescope.sorters".get_generic_fuzzy_sorter,
    path_display                = {"absolute"},
    winblend                    = 0,
    border                      = {},
    --borderchars                 = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
    color_devicons              = true,
    use_less                    = true,
    set_env                     = nil,
    file_previewer              = require"telescope.previewers".vim_buffer_cat.new,
    grep_previewer              = require"telescope.previewers".vim_buffer_vimgrep.new,
    qflist_previewer            = require"telescope.previewers".vim_buffer_qflist.new,
    buffer_previewer_maker      = require"telescope.previewers".buffer_previewer_maker
  },
  extensions = {
    fzy_native = {
      overide_generic_sorter    = false,
      override_file_sorter      = true
    }
  }
}
require("telescope").load_extension("fzy_native")
