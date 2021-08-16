--- ESSENTIAL ---
map("n",    "<Leader>w",    ":w<CR>")
map("n",    "<Leader>c",    ":q<CR>")
map("n",    "<Leader>q",    ":q<CR>")
map("n",    "<Leader>/",    ":CommentToggle<CR>")
map("v",    "<Leader>/",    ":CommentToggle<CR>")

--- BUFFER CONTROL ---
map("n",    "<Leader>=",    "<C-w>=")
map("n",    "<Leader>t",    ":NvimTreeToggle<CR>")
map("v",    "J",            ":m '>+1<CR>gv=gv")
map("v",    "K",            ":m '<-2<CR>gv=gv")

--- BUFFER NAVIGATION ---
map("n",    "<S-h>",        "<C-W><C-H>")
map("n",    "<S-j>",        "<C-W><C-J>")
map("n",    "<S-k>",        "<C-W><C-K>")
map("n",    "<S-l>",        "<C-W><C-L>")

--- BUFFER LINE NAVIGATION ---
map("n",    "<C-l>",        ":bn<CR>")
map("n",    "<C-h>",        ":bp<CR>")
map("n",    "<C-w>",        ":bd<CR>")

--- TELESCOPE ---
map("n",    ";ff",   ":Telescope find_files<CR>")
map("n",    ";fw",   ":Telescope live_grep<CR>")
map("n",    ";fg",   ":Telescope git_branches<CR>")

--- GIT ---
map("n",    ";s",    ":G<CR>")
map("n",    ";c",    ":G commit<CR>")
map("n",    ";gh",   ":diffget //2<CR>")
map("n",    ";gl",   ":diffget //3<CR>")
--map("n",    ";gpl",  ":G pull<CR>")
--map("n",    ";gps",  ":G push<CR>")
--map("n",    ";ga",   ":Git add .<CR>")

--- TERMINAL ---
map("n", ";t",  "<cmd>lua require('toolwindow').open_window('term', nil)<CR>")
