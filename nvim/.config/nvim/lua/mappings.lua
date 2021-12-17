local running, nest = pcall(require, "nest")
if not running then
  return
end

vim.g.mapleader = " "

nest.applyKeymaps {
  {
    "<leader>", {
      {"w", ":w<cr>"},
      {"q", ":q<cr>"},
      {"/", ":CommentToggle<cr>", mode = "nv"},
      {"t", ":NvimTreeToggle<cr>"},
      {"o", ":SymbolsOutline<cr>"},
      {"s", ":TermExec cmd='mvn spring-boot:run'<cr>"},
      {"m", ":lua require('harpoon.ui').toggle_quick_menu()<cr>"},
      {"n", {
          {"s", ":lua require('package-info').show()<cr>"},
          {"h", ":lua require('package-info').hide()<cr>"},
          {"u", ":lua require('package-info').update()<cr>"},
          {"d", ":lua require('package-info').delete()<cr>"},
          {"i", ":lua require('package-info').install()<cr>"},
          {"r", ":lua require('package-info').reinstall()<cr>"},
          {"c", ":lua require('package-info').change_version()<cr>"},
        }
      }
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
      {"m>", ":lua require('harpoon.mark').add_file()<cr>"},
      {"h>", ":lua require('harpoon.ui').nav_file(1)<cr>"},
      {"j>", ":lua require('harpoon.ui').nav_file(2)<cr>"},
      {"k>", ":lua require('harpoon.ui').nav_file(3)<cr>"},
      {"l>", ":lua require('harpoon.ui').nav_file(4)<cr>"},
      {"n>", ":cnext<cr>"},
      {"p>", ":cprev<cr>"},
    },
  },
  {
    ";", {
      {"m", ":MinimapToggle<cr>"},
      {"f", ":Telescope find_files<cr>"},
      {"w", ":Telescope live_grep<cr>"},
      {"s", ":G<cr>"},
      {"p", ":G pull<cr>"},
      {"P", ":G push<cr>"},
      {"c", ":G commit<cr>"},
      {"bb", ":TermExec cmd='yarn build'<cr>"},
      {"bm", ":TermExec cmd='yarn build-min'<cr>"},
      {"bp", ":TermExec cmd='yarn build-prod'<cr>"},
      {"a", ":Telescope lsp_code_actions<cr>"},
      {"vt", ":ToggleTerm direction='vertical'<cr>"},
    },
  },
}
