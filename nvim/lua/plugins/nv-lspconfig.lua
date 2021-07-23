local nvim_lspconfig, _ = pcall(require, "lspconfig")
local nvim_lspinstall, _ = pcall(require, "lspinstall")

if not (nvim_lspconfig or nvim_lspinstall) then
  return
end

local on_attach = function(client, bufnr)
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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function setup_servers()
  local lspinstall = require("lspinstall")
  local lspconfig = require("lspconfig")

  lspinstall.setup()
  local servers = lspinstall.installed_servers()

  for _, lang in pairs(servers) do
    if lang ~= "lua" then
      lspconfig[lang].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = vim.loop.cwd
      }
    elseif lang == "lua" then
      lspconfig[lang].setup {
        root_dir = vim.loop.cwd,
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

--- ERROR SYMBOL ---
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "",
      spacing = 0,
    },
    signs = true,
    underline = true,
  }
)

--- COMPLETION SYMBOLS ---
require("vim.lsp.protocol").CompletionItemKind = {
  "   (Text) ",
  "   (Method)",
  "   (Function)",
  "   (Constructor)",
  " ﴲ  (Field)",
  "[] (Variable)",
  "   (Class)",
  " ﰮ  (Interface)",
  "   (Module)",
  " 襁 (Property)",
  "   (Unit)",
  "   (Value)",
  " 練 (Enum)",
  "   (Keyword)",
  "   (Snippet)",
  "   (Color)",
  "   (File)",
  "   (Reference)",
  "   (Folder)",
  "   (EnumMember)",
  " ﲀ  (Constant)",
  " ﳤ  (Struct)",
  "   (Event)",
  "   (Operator)",
  "   (TypeParameter)"
}

--- SIGN DEFINITION ---
local sdef = function (sign, icon)
  fn.sign_define(sign, { text = icon })
end

sdef("LspDiagnosticsSignError", "")
sdef("LspDiagnosticsSignWarning", "")
sdef("LspDiagnosticsSignInformation", "")
sdef("LspDiagnosticsSignHint", "")
