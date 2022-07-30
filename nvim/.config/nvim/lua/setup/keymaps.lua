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
keymap("n", "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<S-l>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", opts)
keymap("n", "<S-h>", "<cmd>lua require('harpoon.ui').nav_prev() <cr>", opts)

keymap("n", "<C-Up>", "<cmd>resize +2<cr>", opts)
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "J", "<cmd>move '>+1<cr>gv-gv", opts)
keymap("x", "K", "<cmd>move '<-2<cr>gv-gv", opts)

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  desc = 'Open netrw folder with o.',
  callback = function()
    netrw_keymap('o', '<cr>')
  end,
})
