return {
  filetypes = { "java" },
  init_options = {
    jvm_args = {},
    workspace = "/home/runner/workspace"
  },
  root_dir = require("lspconfig").util.root_pattern(".git"),
}
