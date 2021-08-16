local present_lspconfig, _ = pcall(require, "lspconfig")
local present_lspinstall, _ = pcall(require, "lspinstall")

if not (present_lspconfig or present_lspinstall) then
  return
end

-- function to modify default lsp signs
local setup_signs = require "plugins.lsp.set_signs"

-- main function to setup the servers
local function setup_servers()
  local lspinstall = require("lspinstall")
  local lspconfig = require("lspconfig")

  -- on_attach function for lsp
  local on_attach = require "plugins.lsp.on_attach"

  -- capabilities to enable snippets support
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  --capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- servers
  local servers = {
    -- LspInstall
    "lua",
    --"java",
    -- Manually installed servers
    "tsserver",
    "html",
    "cssls",
    --"intelephense",
    "jsonls",
    "sqlls",
    "vuels",
    --"diagnosticls",
    --"efm",
  }

  lspinstall.setup()
  for _, lang in pairs(servers) do
    if pcall(require, "plugins.lsp.servers." .. lang) then
      local setup_server = require("plugins.lsp.servers." .. lang)
      setup_server(lspconfig, on_attach, capabilities)
    end
  end
end

setup_servers()
setup_signs()
