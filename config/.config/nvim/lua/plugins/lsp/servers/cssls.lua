return {
  cmd = { "vscode-css-language-server", "--stdio" },
  root_dir = require("lspconfig").util.root_pattern("package.json", "*.css"),
  filetypes = { "css", "scss", "less" },
  settings = {
    css = {
      validate = true
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    },
  },
}
