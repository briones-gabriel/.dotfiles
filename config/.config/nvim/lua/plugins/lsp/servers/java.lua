return function (lsp, on_attach, capabilities)
  lsp.java.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "java" },
    init_options = {
      jvm_args = {},
      workspace = "/home/runner/workspace"
    },
    root_dir = lsp.util.root_pattern(".git"),
  }
end
