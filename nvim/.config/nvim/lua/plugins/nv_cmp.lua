local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({map_char={tex =""}}))

cmp.setup {
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },

  snippet = {
    expand = function(args)
      require("snippy").expand_snippet(args.body)
    end
  },

  formatting = {
    deprecated = true,
  },

  completion = {
    keyword_length = 1,
    completeopt = "menu,menuone,noinsert",
  },

  documentation = false,

  sorting = {
    priority_weight = 2.0,
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "path"     },
    { name = "snippy"   },
  },
}
