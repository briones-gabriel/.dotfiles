local lspconfig, _ = pcall(require, "lspconfig")

if not lspconfig then
    return
end

require("lspconfig").jsonls.setup {
  cmd = {
    "node",
    DATA_PATH .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
    "--stdio",
  },
  on_attach = require("plugins.lsp.on_attatch"),
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
      end,
    },
  },
}
