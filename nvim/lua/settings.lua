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
opt.scrolloff       = 4                                                        --- Always keep space when scrolling to bottom/top edge
opt.sidescrolloff   = 4                                                        --- Lines to scroll horizontally
opt.cmdheight       = 1    				                                             --- Give more space for displaying messages
opt.conceallevel    = 0                                                        --- so that `` is visible in markdown files
opt.undodir         = PATH .. "/.undo"                                   --- Dir for undos
opt.completeopt     = {"menuone", "noselect"}                                  --- Recommended by nvim-compe
opt.wildignore      = {"**/node_modules/**", "**/.idea/**", "**/.git/**"}      --- Don't search inside Node.js modules (works for gutentag)
opt.clipboard       = {"unnamed", "unnamedplus"}                               --- Copy-paste between vim and everything else
opt.backspace       = {"indent", "eol", "start"}                               --- Making sure backspace works
opt.fillchars       = {eob = " "}                                              --- Hides unnecessary characters
opt.shortmess:append("sIc")
opt.foldmethod      = "indent"
opt.fileencoding    = "utf-8"                                                  --- The enconding written to a file
opt.encoding        = "utf-8"                                                  --- The encoding displayed
opt.colorcolumn     = "120"                                                    --- Sets the color column distance
opt.signcolumn      = "yes"                                                    --- Always show the sign column, otherwise it would shift the text each time

--- TABS ---
opt.shiftwidth      = 2                                                        --- Change a number of space characeters inseted for indentation
opt.showtabline     = 2                                                        --- Always show tabs
opt.tabstop         = 2                                                        --- Insert 2 spaces for a tab
opt.softtabstop     = 2                                                        --- Insert 2 spaces for a tab
opt.expandtab       = true
opt.autoindent      = true                                                     --- Good auto indent

--- LEADER KEY ---
vim.g.mapleader = " "
vim.b.mapleader = " "

--- FUNCTIONS ---
cmd("colorscheme base16-gruvbox-dark-soft")
cmd("filetype plugin indent on")
cmd("set formatoptions-=c")                                                    --- " Stop newline continuation of comments
cmd("set formatoptions-=r")
cmd("set formatoptions-=o")

--- DISABLE BUILT-IN PLUGINS ---
g.loaded_gzip         = 0
g.loaded_tar          = 0
g.loaded_tarPlugin    = 0
g.loaded_zipPlugin    = 0
g.loaded_2html_plugin = 0
g.loaded_netrw        = 0
g.loaded_netrwPlugin  = 0
g.loaded_matchit      = 0
g.loaded_matchparen   = 0
g.loaded_spec         = 0
