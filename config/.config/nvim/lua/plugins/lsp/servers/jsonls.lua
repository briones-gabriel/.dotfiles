return function (lsp, on_attach, capabilities)
  lsp.jsonls.setup {
    flags = {
      debounce_text_changes = 500,
    },
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json" },
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    },
    init_options = {
      provideFormatter = true,
    },
    root_dir = lsp.util.root_pattern(".git", vim.fn.getcwd())
  }
end
