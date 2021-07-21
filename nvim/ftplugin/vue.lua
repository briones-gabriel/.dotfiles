local lspconfig, _ = pcall(require, "lspconfig")

if not lspconfig then
    return
end

require("lspconfig").vuels.setup {
  cmd = { DATA_PATH .. "/lspinstall/vue/node_modules/.bin/vls", "--stdio" },
  on_attach = require("plugins.lsp.on_attatch"),
  root_dir = require("lspconfig").util.root_pattern(".git", "vue.config.js", "package.json", "yarn.lock"),
	filetypes = { "vue", "html", "typescript" },
}
