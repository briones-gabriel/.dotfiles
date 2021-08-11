return function (lsp, on_attach, capabilities)
  lsp.intelephense.setup {
    flags = {
      debounce_text_changes = 500,
    },
    cmd = { "intelephense", "--stdio" },
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "php" },
    root_dir = lsp.util.root_pattern("composer.json", ".git", "index.php"),
  }
end
