local lspconfig, _ = pcall(require, "lspconfig")

if not lspconfig then
    return
end

require("lspconfig").intelephense.setup {
  cmd = { DATA_PATH .. "/lspinstall/php/node_modules/.bin/intelephense", "--stdio" },
  on_attach = require("plugins.lsp.on_attatch"),
  filetypes = { "php" },
  settings = {
    intelephense = {
      environment = {
        phpVersion = 7.4,
      },
    },
  },
}
