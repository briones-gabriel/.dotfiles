return function(client, bufnr)
  local function buf_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_opt(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_opt('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_map("n",    "<Leader>e",    ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_map("n",    "<C-k>",        ":lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_map("n",    "K",            ":lua vim.lsp.buf.hover()<CR>", opts)
  buf_map("n",    "gd",           ":lua vim.lsp.buf.definition()<CR>", opts)
  buf_map("n",    "gr",           ":lua vim.lsp.buf.references()<CR>", opts)
  buf_map("n",    "gD",           ":lua vim.lsp.buf.declaration()<CR>", opts)
  buf_map("n",    ";r",           ":lua vim.lsp.buf.rename()<CR>", opts)
  buf_map("n",    ";d",           ":lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_map("n",    ";a",           ":lua vim.lsp.buf.code_action()<CR>", opts)
  buf_map("n",    ";i",           ":lua vim.lsp.buf.implementation()<CR>", opts)
  buf_map("n",    ";n",           ":lua vim.lsp.diagnostic.goto_next()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_map("n",    "<Leader>f",    ":lua vim.lsp.buf.formatting()<CR>", opts)
  end
end
