-- Turn these off at startup, will be enabled later just before loading the theme
vim.cmd([[
    syntax off
    filetype off
    filetype plugin indent off
]])

--- GENERAL ---
opt.number          = true                                                     --- Shows current line number
opt.relativenumber  = true                                                     --- Enables relative number
opt.cursorline      = true                                                     --- Highlight of current line
opt.hidden          = true                                                     --- Required to keep multiple buffers open multiple buffers
opt.splitright      = true                                                     --- Vertical splits will automatically be to the right
opt.smartcase       = true                                                     --- Uses case in search
opt.smarttab        = true                                                     --- Makes tabbing smarter will realize you have 2 vs 4
opt.smartindent     = true                                                     --- Makes indenting smart
opt.undofile        = true                                                     --- Sets undo to file
opt.incsearch       = true                                                     --- Start searching before pressing enter
opt.lazyredraw      = true                                                     --- Makes macros faster & prevent errors in complicated mappings
opt.ignorecase      = true                                                     --- Ignore case in search patterns
opt.splitbelow      = true                                                     --- force all horizontal splits to go below current window
opt.wrap            = false                                                    --- Display long lines as just one line
opt.backup          = false                                                    --- Recommended
opt.swapfile        = false                                                    --- Recommended
opt.showmode        = false                                                    --- Don't show things like -- INSERT -- anymore
opt.errorbells      = false                                                    --- Disables sound effect for errors
opt.backup          = false                                                    --- Creates a backup file
opt.writebackup     = false                                                    --- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.hlsearch        = false
opt.timeoutlen      = 400                                                      --- Faster completion
opt.updatetime      = 250
opt.foldlevelstart  = 4
opt.scrolloff       = 4                                                        --- Always keep space when scrolling to bottom/top edge
opt.sidescrolloff   = 4                                                        --- Lines to scroll horizontally
opt.cmdheight       = 1    				                                             --- Give more space for displaying messages
opt.conceallevel    = 0                                                        --- so that `` is visible in markdown files
opt.foldcolumn      = "0"
opt.foldmethod      = "expr"
opt.undodir         = PATH .. ".undo"                                   --- Dir for undos
opt.completeopt     = {"menu","menuone", "noselect"}                                  --- Recommended by nvim-compe
opt.wildignore      = {"**/node_modules/**", "**/.idea/**", "**/.git/**"}      --- Don't search inside Node.js modules (works for gutentag)
opt.clipboard       = {"unnamed", "unnamedplus"}                               --- Copy-paste between vim and everything else
opt.backspace       = {"indent", "eol", "start"}                               --- Making sure backspace works
opt.fillchars       = {eob = " "}                                              --- Hides unnecessary characters
opt.shortmess:append("sIc")
opt.shell           = "/bin/bash"
opt.guicursor       = "i:block"
opt.fileencoding    = "utf-8"                                                  --- The enconding written to a file
opt.encoding        = "utf-8"                                                  --- The encoding displayed
opt.colorcolumn     = "120"                                                    --- Sets the color column distance
opt.signcolumn      = "yes"                                                    --- Always show the sign column, otherwise it would shift the text each time

--- TABS ---
opt.expandtab       = true
opt.autoindent      = true                                                     --- Good auto indent

--- LEADER KEY ---
vim.g.mapleader = " "
vim.b.mapleader = " "

--- DISABLE BUILT-IN PLUGINS ---
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
