local present, diffview = pcall(require, "diffview")

if not present then
  return
end

local dv_conf = require("diffview.config").diffview_callback

diffview.setup {
  diff_binaries = false,    -- Show diffs for binaries
  use_icons = true,         -- Requires nvim-web-devicons
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  file_panel = {
    position = "left",      -- One of 'left', 'right', 'top', 'bottom'
    width = 35,             -- Only applies when position is 'left' or 'right'
    height = 10,            -- Only applies when position is 'top' or 'bottom'
  },
  file_history_panel = {
    position = "bottom",
    width = 35,
    height = 16,
    log_options = {
      max_count = 256,      -- Limit the number of commits
      follow = false,       -- Follow renames (only for single file)
      all = false,          -- Include all refs under 'refs/' including HEAD
      merges = false,       -- List only merge commits
      no_merges = false,    -- List no merge commits
      reverse = false,      -- List commits in reverse order
    },
  },
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"]      = dv_conf("select_next_entry"),  -- Open the diff for the next file
      ["<s-tab>"]    = dv_conf("select_prev_entry"),  -- Open the diff for the previous file
      ["gf"]         = dv_conf("goto_file"),          -- Open the file in a new split in previous tabpage
      ["<C-w><C-f>"] = dv_conf("goto_file_split"),    -- Open the file in a new split
      ["<C-w>gf"]    = dv_conf("goto_file_tab"),      -- Open the file in a new tabpage
      ["<leader>e"]  = dv_conf("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"]  = dv_conf("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = dv_conf("next_entry"),         -- Bring the cursor to the next file entry
      ["<down>"]        = dv_conf("next_entry"),
      ["k"]             = dv_conf("prev_entry"),         -- Bring the cursor to the previous file entry.
      ["<up>"]          = dv_conf("prev_entry"),
      ["<cr>"]          = dv_conf("select_entry"),       -- Open the diff for the selected entry.
      ["o"]             = dv_conf("select_entry"),
      ["<2-LeftMouse>"] = dv_conf("select_entry"),
      ["-"]             = dv_conf("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"]             = dv_conf("stage_all"),          -- Stage all entries.
      ["U"]             = dv_conf("unstage_all"),        -- Unstage all entries.
      ["X"]             = dv_conf("restore_entry"),      -- Restore entry to the state on the left side.
      ["R"]             = dv_conf("refresh_files"),      -- Update stats and entries in the file list.
      ["<tab>"]         = dv_conf("select_next_entry"),
      ["<s-tab>"]       = dv_conf("select_prev_entry"),
      ["gf"]            = dv_conf("goto_file"),
      ["<C-w><C-f>"]    = dv_conf("goto_file_split"),
      ["<C-w>gf"]       = dv_conf("goto_file_tab"),
      ["<leader>e"]     = dv_conf("focus_files"),
      ["<leader>b"]     = dv_conf("toggle_files"),
    },
    file_history_panel = {
      ["g!"]            = dv_conf("options"),            -- Open the option panel
      ["<C-d>"]         = dv_conf("open_in_diffview"),   -- Open the entry under the cursor in a diffview
      ["zR"]            = dv_conf("open_all_folds"),
      ["zM"]            = dv_conf("close_all_folds"),
      ["j"]             = dv_conf("next_entry"),
      ["<down>"]        = dv_conf("next_entry"),
      ["k"]             = dv_conf("prev_entry"),
      ["<up>"]          = dv_conf("prev_entry"),
      ["<cr>"]          = dv_conf("select_entry"),
      ["o"]             = dv_conf("select_entry"),
      ["<2-LeftMouse>"] = dv_conf("select_entry"),
      ["<tab>"]         = dv_conf("select_next_entry"),
      ["<s-tab>"]       = dv_conf("select_prev_entry"),
      ["gf"]            = dv_conf("goto_file"),
      ["<C-w><C-f>"]    = dv_conf("goto_file_split"),
      ["<C-w>gf"]       = dv_conf("goto_file_tab"),
      ["<leader>e"]     = dv_conf("focus_files"),
      ["<leader>b"]     = dv_conf("toggle_files"),
    },
    option_panel = {
      ["<tab>"] = dv_conf("select"),
      ["q"]     = dv_conf("close"),
    },
  },
}
