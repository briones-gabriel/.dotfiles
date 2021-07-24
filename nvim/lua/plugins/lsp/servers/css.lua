return function (lsp, on_attach)
  lsp.html.setup {
    on_attach = on_attach,
    filetypes = { "css", "scss", "less" },
    root_dir = lsp.util.root_pattern("package.json"),
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
