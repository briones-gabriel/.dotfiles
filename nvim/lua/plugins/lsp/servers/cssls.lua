return function (lsp, on_attach, capabilities)
  lsp.cssls.setup {
    cmd = { "vscode-css-language-server", "--stdio" },
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = lsp.util.root_pattern("package.json"),
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
end
