local lspconfig, _ = pcall(require, "lspconfig")
local lspinstall, _ = pcall(require, "lspinstall")

if not (lspconfig or lspinstall) then
    return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{
      capabilities = capabilities
    }
  end
end

setup_servers()

require("plugins.lsp.settings")()
