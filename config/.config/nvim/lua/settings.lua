-- Turn these off at startup, will be enabled later just before loading the theme
vim.cmd([[
    syntax off
    filetype off
    filetype plugin indent off
]])

--- GENERAL ---
opt.number          = true
opt.relativenumber  = true
opt.cursorline      = true
opt.hidden          = true
opt.splitright      = true
opt.smartcase       = true
opt.smarttab        = true
opt.smartindent     = true
opt.undofile        = true
opt.incsearch       = true
opt.lazyredraw      = true
opt.ignorecase      = true
opt.splitbelow      = true
opt.wrap            = false
opt.backup          = false
opt.swapfile        = false
opt.showmode        = false
opt.errorbells      = false
opt.backup          = false
opt.writebackup     = false
opt.hlsearch        = false
opt.updatetime      = 250
opt.scrolloff       = 4
opt.sidescrolloff   = 4
opt.cmdheight       = 1
opt.conceallevel    = 0
opt.undodir         = vim.fn.stdpath('config') .. '/undo'
opt.completeopt     = {"menu","menuone", "noselect"}
opt.wildignore      = {"**/node_modules/**", "**/.idea/**", "**/.git/**"}
opt.clipboard       = {"unnamed", "unnamedplus"}
opt.backspace       = {"indent", "eol", "start"}
opt.fillchars       = {eob = " "}
opt.shortmess:append("sIc")
opt.shell           = "/bin/bash"
opt.guicursor       = "i:block"
opt.fileencoding    = "utf-8"
opt.encoding        = "utf-8"
opt.colorcolumn     = "120"
opt.signcolumn      = "yes"
vim.wo.foldmethod   = "expr"
vim.wo.fillchars    = "fold:\\"
vim.wo.foldnestmax  = 3
vim.wo.foldminlines = 1
vim.o.foldtext      = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

--- TABS ---
opt.expandtab       = true
opt.autoindent      = true

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
