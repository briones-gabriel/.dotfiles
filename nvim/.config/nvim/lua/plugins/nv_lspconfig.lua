-- Setup the servers
local lsp_installer = require("nvim-lsp-installer")
local null_ls = require("null-ls")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local border = {
  {"┌", "FloatBorder"},
  {"─", "FloatBorder"},
  {"┐", "FloatBorder"},
  {"│", "FloatBorder"},
  {"┘", "FloatBorder"},
  {"─", "FloatBorder"},
  {"└", "FloatBorder"},
  {"│", "FloatBorder"},
}

local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

local on_attach = function (client, bufnr)
  local function buf_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_opt(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_opt("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }

  buf_map("n",    "K",            ":lua vim.lsp.buf.hover()<CR>", opts)
  buf_map("n",    "gd",           ":lua vim.lsp.buf.definition()<CR>", opts)
  buf_map("n",    "gr",           ":lua vim.lsp.buf.references()<CR>", opts)
  buf_map("n",    "gn",           ":lua vim.diagnostic.goto_next()<CR>", opts)
  buf_map("n",    "gp",           ":lua vim.diagnostic.goto_prev()<CR>", opts)
  -- buf_map("n",    ";a",           ":lua vim.lsp.buf.code_action()<CR>", opts)
  buf_map("n",    ";r",           ":lua vim.lsp.buf.rename()<CR>", opts)
  buf_map("n",    "<Leader>e",    ":lua vim.diagnostic.open_float()<CR>", opts)
  buf_map("n",    "<Leader>f",    ":lua vim.lsp.buf.formatting()<CR>", opts)

  -- Lsp fast action (flutter)
  buf_map("n", "<leader>a", "<cmd>lua require('lsp-fastaction').code_action()<CR>", opts)
  buf_map("v", "<leader>a", "<esc><cmd>lua require('lsp-fastaction').range_code_action()<CR>", opts)
end

lsp_installer.on_server_ready(
function(server)
  local opts = {}

  if (pcall(require, "lsp/" .. server.name)) then
    opts = require("lsp/" .. server.name)
  end

  opts.on_attach = on_attach
  opts.handlers = handlers
  opts.capabilities = capabilities
  opts.flags = {debounce_text_changes = 500}

  server:setup(opts)
end
)

-- Null-ls config
null_ls.setup({
  debounce = 500,
  on_attach = on_attach,
  sources = {
    null_ls.builtins.formatting.prettier.with({
      extra_args = function(params)
        return params.options
        and params.options.tabSize
        and {
          "--tab-width",
          params.options.tabSize,
        }
      end,
      prefer_local = "node_modules/.bin",
    }),
  },
})

-- Diagnostics config
vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
  },
  float = {
    source = "if_many",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.cmd [[
  highlight DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
  highlight DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
  highlight DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
