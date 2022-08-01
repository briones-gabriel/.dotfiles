local M = {}

local keymap = vim.keymap.set

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp_present, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if cmp_nvim_lsp_present then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

local function set_server_keymaps(buffer)
  local buffer_opts = { noremap = true, silent = true, buffer = buffer }

  keymap('n', 'gd', vim.lsp.buf.definition, buffer_opts)
  keymap('n', 'K', vim.lsp.buf.hover, buffer_opts)
  keymap('n', 'gi', vim.lsp.buf.implementation, buffer_opts)
  keymap('n', 'gr', vim.lsp.buf.references, buffer_opts)
  keymap('n', '<space>rn', vim.lsp.buf.rename, buffer_opts)
  keymap('n', '<space>ca', vim.lsp.buf.code_action, buffer_opts)
  keymap('n', '<space>lf', vim.lsp.buf.formatting, buffer_opts)
end

M.setup = function()
  local signs = { Error = "", Warn = "", Hint = "", Info = "" }

  for sign_type, sign in pairs(signs) do
    local sign_name = "DiagnosticSign" .. sign_type

    vim.fn.sign_define(sign_name, { text = sign, texthl = sign_name, numhl = sign_name })
  end

  vim.diagnostic.config({
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    virtual_text = {
      source = "if_many",
    },
    float = {
      source = "if_many",
      style = 'minimal',
    },
  })

  local opts = { noremap = true, silent = true }

  keymap('n', '<space>e', vim.diagnostic.open_float, opts)
  keymap('n', '[d', vim.diagnostic.goto_prev, opts)
  keymap('n', ']d', vim.diagnostic.goto_next, opts)
end

M.on_attach = function(client, buffer)
  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  set_server_keymaps(buffer)
end

M.capabilities = capabilities

return M
