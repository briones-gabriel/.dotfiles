local present_lspconfig, _ = pcall(require, "lspconfig")
local present_lspinstall, _ = pcall(require, "lspinstall")

if not (present_lspconfig or present_lspinstall) then
  return
end

-- on_attach function for lsp
local on_attach = require "lua.plugins.lsp.lsp_on_attach"
local setup_signs = require "lua.plugins.lsp.lsp_signs"

-- capabilities to enable snippets support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- main function to setup the servers
local function setup_servers()
  local lspinstall = require("lspinstall")
  local lspconfig = require("lspconfig")
  local root_dir = vim.loop.cwd

  lspinstall.setup()
  local servers = lspinstall.installed_servers()

  for _, lang in pairs(servers) do
    if lang ~= "lua" then
      lspconfig[lang].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = root_dir
      }
    elseif lang == "lua" then
      lspconfig[lang].setup {
        root_dir = root_dir,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = {"vim"}
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
              },
              maxPreload = 100000,
              preloadFileSize = 10000
            },
            telemetry = {
              enable = false
            }
          }
        }
      }
    end
  end
end

setup_servers()
setup_signs()
