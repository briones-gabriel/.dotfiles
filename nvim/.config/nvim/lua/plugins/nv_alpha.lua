local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

dashboard.section.buttons.val = {
  dashboard.button( "n", "  New file" ,  ":ene <BAR> startinsert <cr>"),
  dashboard.button( "t", "  Project files" , ":NvimTreeToggle<cr>"),
  dashboard.button( "f", "  Find files", ":Telescope find_files<cr>"),
  dashboard.button( "q", "  Quit Neovim" , ":qa<cr>"),
}

alpha.setup(dashboard.opts)
