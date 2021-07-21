local lspconfig, _ = pcall(require, "lspconfig")

if not lspconfig then
    return
end

require("lspconfig").tsserver.setup {
  cmd = {
    DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
    "--stdio",
  },
	filetypes = { "typescript" },
  on_attach = require("plugins.lsp.on_attatch"),
  root_dir = require("lspconfig/util").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}
