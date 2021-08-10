local present, _ = pcall(require, "compe")
if not present then
  return
end

require("compe").setup {
  enabled             = true;
  autocomplete        = true;
  debug               = false;
  min_length          = 1;
  preselect           = "enable";
  throttle_time       = 80;
  source_timeout      = 200;
  resolve_timeout     = 800;
  incomplete_delay    = 400;
  max_abbr_width      = 100;
  max_kind_width      = 100;
  max_menu_width      = 0;
  documentation = {
    border            = borders,
    winhighlight      = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width         = 120,
    min_width         = 60,
    max_height        = math.floor(vim.o.lines * 0.3),
    min_height        = 1,
  },
  source = {
    nvim_lsp          = true,
    path              = { kind = "   (Path)" },
    luasnip           = { kind = "   (Snippet)" },
    spell             = { kind = "   (Spell)" },
    buffer            = { kind = "   (Buffer)" },
  },
}

--- TAB FUNCTIONS ---
local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  return nil
end

local luasnip = prequire('luasnip')

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif luasnip and luasnip.expand_or_jumpable() then
    return t "<cmd>lua require'luasnip'.jump(1)<Cr>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif luasnip and luasnip.jumpable(-1) then
    return t "<cmd>lua require'luasnip'.jump(-1)<CR>"
  else
    return t "<S-Tab>"
  end
end

--- MAPS ---
map("i",    "<CR>",        "compe#confirm('<CR>')",     {expr = true})
map("i",    "<Tab>",       "v:lua.tab_complete()",      {expr = true})
map("s",    "<Tab>",       "v:lua.tab_complete()",      {expr = true})
map("i",    "<S-Tab>",     "v:lua.s_tab_complete()",    {expr = true})
map("s",    "<S-Tab>",     "v:lua.s_tab_complete()",    {expr = true})
