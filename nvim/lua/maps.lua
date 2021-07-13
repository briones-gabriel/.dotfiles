--- ESSENTIAL ---
map("n",    "<Leader>w",    ":w<CR>")
map("n",    "<Leader>q",    ":quitall<CR>")
map("n",    "<Leader>st2",  ":lua set_tabs(2)<CR>")
map("n",    "<Leader>st4",  ":lua set_tabs(4)<CR>")
map("n",    "<Leader>/",    ":CommentToggle<CR>")
cmap("v",   "<Leader>/",    ":CommentToggle<CR>", optns)

--- BUFFER CONTROL ---
map("n",    "<Leader>=",    "<C-w>=")
map("n",    "<Leader>t",    ":NvimTreeToggle<CR>")
map("v",    "J",            ":m '>+1<CR>gv=gv")
map("v",    "K",            ":m '<-2<CR>gv=gv")

-- BUFFER NAVIGATION ---
map("n",    "<S-h>",        "<C-W><C-H>")
map("n",    "<S-j>",        "<C-W><C-J>")
map("n",    "<S-k>",        "<C-W><C-K>")
map("n",    "<S-l>",        "<C-W><C-L>")

-- BUFFER LINE NAVIGATION ---
map("n",    "<C-l>",        ":tabnext<CR>")
map("n",    "<C-h>",        ":tabprev<CR>")
map("n",    "<C-w>",        ":tabclose<CR>")

-- TELESCOPE ---
map("n",    ";f",   ":lua require('telescope.builtin').find_files({ previewer = false })<CR>")

-- GIT ---
map("n",    ";gs",   ":G<CR>")
map("n",    ";gpl",  ":G pull<CR>")
map("n",    ";gps",  ":G push<CR>")
map("n",    ";gc",   ":G commit<CR>")
map("n",    ";ga",   ":Git add .<CR>")
map("n",    ";gh",   ":diffget //2<CR>")
map("n",    ";gl",   ":diffget //3<CR>")
