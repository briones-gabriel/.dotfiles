return function(client, bufnr)
  local function buf_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_opt(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_opt("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_map("n",    "fd",           ":lua vim.lsp.buf.definition()<CR>", opts)
  buf_map("n",    "fr",           ":lua vim.lsp.buf.references()<CR>", opts)
  buf_map("n",    "gn",           ":lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_map("n",    "<Leader>e",    ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)

  -- Setup LspSaga
  if pcall(require, "lspsaga") then
    local setup_saga = require "plugins.lsp.set_saga"
    setup_saga()

    buf_map("v",    ";a",           ":<C-U>Lspsaga range_code_action<CR>", opts)
    buf_map("n",    ";a",           ":Lspsaga code_action<CR>", opts)
    buf_map("n",    ";r",           ":Lspsaga rename<CR>", opts)
    buf_map("n",    "K",            ":Lspsaga hover_doc<CR>", opts)
    buf_map("n",    "<C-k>",        ":Lspsaga signature_help<CR>", opts)
    buf_map("n",    "<C-f>",        ":lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
    buf_map("n",    "<C-b>",        ":lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
    buf_map("n",    "<C-d>",        ":Lspsaga preview_definition<CR>", opts)
  end

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_map("n",    "<Leader>f",    ":lua vim.lsp.buf.formatting()<CR>", opts)
  end
end
