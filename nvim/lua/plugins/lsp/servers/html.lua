return function (lsp, on_attach, capabilities)
  lsp.html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "vscode-html-language-server", "--stdio" },
    settings = {},
    filetypes = { "html", "php" },
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true,
      },
    },
    root_dir = function(_)
      return vim.loop.os_homedir()
    end,
  }
end
