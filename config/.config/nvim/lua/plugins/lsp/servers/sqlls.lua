return function (lsp, on_attach, capabilities)
  lsp.sqlls.setup {
    flags = {
      debounce_text_changes = 500,
    },
    cmd = { 'sql-language-server', 'up', '--method', 'stdio' },
    filetypes = { "sql", "mysql" },
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function(_)
      return vim.loop.os_homedir()
    end,
    settings = {
      sqlLanguageServer = {
        lint = {
          rules = {
            ["align-column-to-the-first"] = "off",
            ["column-new-line"] = "error",
            ["linebreak-after-clause-keyword"] = "off",
            ["reserved-word-case"] = {"error", "upper"},
            ["space-surrounding-operators"] = "error",
            ["where-clause-new-line"] = "off",
            ["align-where-clause-to-the-first"] = "error"
          }
        }
      },
    },
  }
end
