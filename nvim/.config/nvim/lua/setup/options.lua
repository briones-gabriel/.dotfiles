local options = {
  number         = true,
  relativenumber = true,
  cursorline     = true,
  hidden         = true,
  splitright     = true,
  smartcase      = true,
  smarttab       = true,
  smartindent    = true,
  undofile       = true,
  incsearch      = true,
  lazyredraw     = true,
  ignorecase     = true,
  splitbelow     = true,
  wrap           = false,
  backup         = false,
  swapfile       = false,
  showmode       = false,
  errorbells     = false,
  writebackup    = false,
  hlsearch       = false,
  updatetime     = 250,
  foldlevel      = 99,
  pumheight      = 12,
  laststatus     = 3,
  scrolloff      = 4,
  sidescrolloff  = 4,
  cmdheight      = 1,
  conceallevel   = 0,
  showtabline    = 0,
  undodir        = vim.fn.stdpath('config') .. '/.undo',
  completeopt    = { 'menu', 'menuone', 'noselect' },
  wildignore     = { '**/node_modules/**', '**/.idea/**', '**/.git/**' },
  clipboard      = { 'unnamed', 'unnamedplus' },
  backspace      = { 'indent', 'eol', 'start' },
  fillchars      = { eob = ' ' },
  fileencoding   = 'utf-8',
  encoding       = 'utf-8',
  colorcolumn    = '120',
  signcolumn     = 'yes',
  expandtab      = true,
  autoindent     = true,
  shiftwidth     = 2,
  tabstop        = 2,
  softtabstop    = 2,
}

local globals = {
  netrw_banner = 0,
  netrw_browse_split = 4,
  netrw_winsize = 30,
  netrw_liststyle = 3,
}

vim.opt.shortmess:append('c')

for k, v in pairs(options) do
  vim.opt[k] = v
end

for k, v in pairs(globals) do
  vim.g[k] = v
end
