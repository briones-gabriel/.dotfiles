return function (lsp, on_attach)
  lsp.php.setup {
    on_attach = on_attach,
    filetypes = { "php" },
    root_dir = lsp.util.root_pattern("composer.json", ".git"),
  }
end
