local cmp_present, cmp = pcall(require, 'cmp')

if not cmp_present then
  return
end

local luasnip_present, luasnip = pcall(require, 'luasnip')

if not luasnip_present then
  return
end

local autopairs_present, autopairs = pcall(require, 'nvim-autopairs.completion.cmp')

if autopairs_present then
  cmp.event:on(
    'confirm_done',
    autopairs.on_confirm_done()
  )
end

require('luasnip/loaders/from_vscode').lazy_load()

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup {
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  formatting = {
    deprecated = true,
  },

  completion = {
    keyword_length = 1,
    completeopt = 'menu,menuone,noinsert',
  },

  window = {
    documentation = false,
  },

  sorting = {
    priority_weight = 2.0,
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 8 },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  enabled = function()
    -- disable completion in comments
    local context = require('cmp.config.context')
    -- keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      -- disable completion in prompts
      if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
        return false
      else
        return not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")
      end
    end
  end
}
