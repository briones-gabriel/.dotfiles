return function (lsp, on_attach, capabilities)
  if pcall(lsp, "java") then
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
end
