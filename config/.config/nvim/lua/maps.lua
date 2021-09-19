local nest = require("nest")

--- LEADER KEY
vim.g.mapleader = " "

nest.applyKeymaps {
  {
    "<leader>", {
      {"w", ":w<cr>"},
      {"q", ":q<cr>"},
      {"/", ":CommentToggle<cr>", mode = "nv"},
      {"t", ":NvimTreeToggle<cr>"},
    },
  },
  {
    "<S-", {
      {"h>", "<C-W><C-H>"},
      {"j>", "<C-W><C-J>"},
      {"k>", "<C-W><C-K>"},
      {"l>", "<C-W><C-L>"},
    },
  },
  {
    "<C-", {
      {"l>", ":BufferLineCycleNext<cr>"},
      {"h>", ":BufferLineCyclePrev<cr>"},
      {"w>", ":bd<cr>"},
    },
  },
  {
    ";", {
      {"f", ":Telescope find_files<cr>"},
      {"s", ":G<cr>"},
      {"c", ":G commit<cr>"},
      {"t", ":lua require('toolwindow').open_window('term', nil)<cr>"},
    },
  },
}
