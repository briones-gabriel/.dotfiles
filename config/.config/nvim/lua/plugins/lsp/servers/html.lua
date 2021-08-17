return {
  cmd = { "vscode-html-language-server", "--stdio" },
  settings = {},
  filetypes = { "html" },
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
