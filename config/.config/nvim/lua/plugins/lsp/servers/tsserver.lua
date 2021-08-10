return function (lsp, on_attach, capabilities)
  lsp.tsserver.setup {
    flags = {
      debounce_text_changes = 500,
    },
    capabilities = capabilities,
    on_attach = on_attach,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  }
end
