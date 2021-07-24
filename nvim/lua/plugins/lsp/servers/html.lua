return function (lsp, on_attach)
  lsp.html.setup {
    on_attach = on_attach,
    settings = {},
    filetypes = { "html" },
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true,
      },
    },
    root_dir = function()
      return vim.loop.os_homedir()
    end,
  }
end
