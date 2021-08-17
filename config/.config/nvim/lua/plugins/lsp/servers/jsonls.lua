return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json" },
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
  root_dir = require("lspconfig").util.root_pattern(".git", vim.fn.getcwd()),
}
