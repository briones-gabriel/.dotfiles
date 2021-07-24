return function (lsp, on_attach)
  lsp.java.setup {
    on_attach = on_attach,
    filetypes = { "java" },
    init_options = {
      jvm_args = {},
      workspace = "/home/runner/workspace"
    },
    root_dir = lsp.util.root_pattern(".git"),
  }
end
