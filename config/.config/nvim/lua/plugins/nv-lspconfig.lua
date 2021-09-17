local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

-- function to modify default lsp signs
local setup_signs = require "plugins.lsp.set_signs"

-- main function to setup the servers
local function setup_servers()
  local cmp_lsp = require("cmp_nvim_lsp")
  local lspinstall = require "lspinstall"

  -- on_attach function for lsp
  local on_attach = require "plugins.lsp.on_attach"

  -- language servers
  local servers = {
    -- LspInstall
    "lua",
    --"java",
    -- Manually installed servers
    "tsserver",
    "html",
    "cssls",
    "intelephense",
    --"jsonls",
    "sqlls",
    "vuels",
    --"diagnosticls",
    --"efm",
  }

  lspinstall.setup()

  for _, server in pairs(servers) do
    if pcall(require, "plugins.lsp.servers." .. server) then
      local server_setup = require("plugins.lsp.servers." .. server)
      local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
      capabilities = cmp_lsp.update_capabilities(capabilities)

      server_setup.capabilities = capabilities
      server_setup.on_attach = on_attach
      server_setup.flags = { debounce_text_changes = 500 }

      lspconfig[server].setup(server_setup)
    end
  end
end

setup_servers()
setup_signs()
