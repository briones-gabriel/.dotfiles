local present_lspconfig, _ = pcall(require, "lspconfig")
local present_lspinstall, _ = pcall(require, "lspinstall")

if not (present_lspconfig or present_lspinstall) then
  return
end

-- on_attach function for lsp
local on_attach = require "plugins.lsp.on_attach"
local setup_signs = require "plugins.lsp.set_signs"

-- capabilities to enable snippets support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- main function to setup the servers
local function setup_servers()
  local lspinstall = require("lspinstall")
  local lspconfig = require("lspconfig")

  lspinstall.setup()
  local servers = lspinstall.installed_servers()

  for _, lang in pairs(servers) do
    if pcall(require, "plugins.lsp.servers." .. lang) then
      local setup_server = require("plugins.lsp.servers." .. lang)
      setup_server(lspconfig, on_attach)
    end
  end
end

setup_servers()
setup_signs()
