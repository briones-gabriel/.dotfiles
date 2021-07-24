return function (lsp, on_attach)
  lsp.typescript.setup {
    on_attach = on_attach,
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  }
end
