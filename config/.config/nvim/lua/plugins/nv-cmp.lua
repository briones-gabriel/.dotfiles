local _, present = pcall(require, "cmp")
if not present then
  return
end

local minsnip = require "minsnip"
local cmp = require "cmp"
local icons = {
  Class       = "   (Class)",
  Color       = "   (Color)",
  Constant    = " ﲀ  (Constant)",
  Constructor = "   (Constructor)",
  Enum        = " 練 (Enum)",
  EnumMember  = "   (EnumMember)",
  Field       = "   (Field)",
  File        = "   (File)",
  Folder      = "   (Folder)",
  Function    = "   (Function)",
  Interface   = " ﰮ  (Interface)",
  Keyword     = "   (Keyword)",
  Method      = "   (Method)",
  Module      = "   (Module)",
  Property    = " 襁 (Property)",
  Snippet     = "   (Snippet)",
  Struct      = " ﳤ  (Struct)",
  Text        = "   (Text) ",
  Unit        = "   (Unit)",
  Value       = "   (Value)",
  Variable    = "  (Variable)",
}

cmp.setup {
  mapping = {
    ["<Tab>"] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
      elseif not minsnip.jump() then
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
      elseif not minsnip.jump_backwards() then
        fallback()
      end
    end,
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  snippet = {
    expand = function(args)
      minsnip.expand_anonymous(args.body)
    end,
  },

  formatting = {
    deprecated = true,
    format = function(_, vim_item)
      vim_item.kind = icons[vim_item.kind]
      return vim_item
    end
  },

  completion = {
    keyword_length = 2,
  },

  documentation = {
    type = cmp.DocumentationConfig,
    border = "single",
  },

  sorting = {
    priority_weight = 2.0,
  },

  sources = {
    { name = "minsnip"  },
    { name = "nvim_lsp" },
    { name = "path"     },
    --{ name = "buffer"   },
  },
}
