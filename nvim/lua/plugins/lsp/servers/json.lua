return function (lsp, on_attach)
  lsp.json.setup {
    on_attach = on_attach,
    filetypes = { "json" },
    init_options = {
      provideFormatter = true
    },
    root_dir = lsp.util.root_pattern(".git", vim.fn.getcwd()),
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      },
    },
  }
end
