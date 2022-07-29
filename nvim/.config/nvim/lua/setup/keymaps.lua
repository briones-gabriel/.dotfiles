local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set
local netrw_keymap = function(key, map)
  vim.cmd('nmap <buffer> ' .. key .. ' ' .. map)
end

vim.g.mapleader = " "

vim.g.maplocalleader = " "

keymap('', '<Space>', '<Nop>', opts)

keymap('n', '<leader>w', '<cmd>w<cr>', opts)
keymap('n', '<leader>q', '<cmd>q<cr>', opts)
keymap('n', '<leader>t', '<cmd>NvimTreeToggle<cr>', opts)
keymap('n', '<leader>g', '<cmd>G<cr>', opts)
keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<leader>fs', '<cmd>Telescope live_grep<cr>', opts)

keymap("n", "<S-h>", "<C-w>h", opts)
keymap("n", "<S-j>", "<C-w>j", opts)
keymap("n", "<S-k>", "<C-w>k", opts)
keymap("n", "<S-l>", "<C-w>l", opts)

keymap("n", "<C-l>", ":bnext<CR>", opts)
keymap("n", "<C-h>", ":bprevious<CR>", opts)

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  desc = 'Open netrw folder with o.',
  callback = function()
    netrw_keymap('o', '<cr>')
  end,
})
