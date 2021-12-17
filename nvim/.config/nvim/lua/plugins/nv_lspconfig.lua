-- Setup the servers
local lsp_installer = require("nvim-lsp-installer")
local null_ls = require("null-ls")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

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
  buf_map("n",    "gn",           ":lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_map("n",    "gp",           ":lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  -- buf_map("n",    ";a",           ":lua vim.lsp.buf.code_action()<CR>", opts)
  buf_map("n",    ";r",           ":lua vim.lsp.buf.rename()<CR>", opts)
  buf_map("n",    "<Leader>e",    ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_map("n",    "<Leader>f",    ":lua vim.lsp.buf.formatting()<CR>", opts)
end

lsp_installer.on_server_ready(
  function(server)
    local opts = {}

    if (pcall(require, "lsp/" .. server.name)) then
      opts = require("lsp/" .. server.name)
    end

    opts.on_attach = on_attach
    opts.flags = {debounce_text_changes = 500}

    opts.capabilities = capabilities

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
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

-- Set LSP UI
local lsp = vim.lsp
local handlers = lsp.handlers
local borders = {
  {"┌", "FloatBorder"},
  {"─", "FloatBorder"},
  {"┐", "FloatBorder"},
  {"│", "FloatBorder"},
  {"┘", "FloatBorder"},
  {"─", "FloatBorder"},
  {"└", "FloatBorder"},
  {"│", "FloatBorder"},
}

handlers["textDocument/hover"] = lsp.with(handlers.hover, {border = borders})
handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, {border = borders})
handlers["textDocument/publishDiagnostics"] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "",
      spacing = 0,
    },
    signs = false,
    underline = true,
    update_in_insert = true,
  }
)

for type, icon in pairs({Error = " ", Warning = " ", Hint = " ", Information = " "}) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
