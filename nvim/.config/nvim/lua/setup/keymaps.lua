local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set
local netrw_keymap = function(key, map)
  vim.cmd('nmap <buffer> ' .. key .. ' ' .. map)
end

vim.g.mapleader = " "

vim.g.maplocalleader = " "

keymap('', '<Space>', '<Nop>', opts)

keymap('n', '<leader>w', ':w<cr>', opts)
keymap('n', '<leader>q', ':q<cr>', opts)
keymap('n', '<leader>t', ':Lexplore<cr>', opts)
keymap('n', '<leader>g', ':G<cr>', opts)
keymap('n', '<leader>f', ':Telescope find_files<cr>', opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

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
    netrw_keymap('n', '%')
  end,
})
