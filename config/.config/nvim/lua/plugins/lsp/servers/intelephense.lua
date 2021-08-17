return {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_dir = require("lspconfig").util.root_pattern("composer.json", ".git", "*.php"),
}
