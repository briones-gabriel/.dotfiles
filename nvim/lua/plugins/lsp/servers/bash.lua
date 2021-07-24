return function (lsp, on_attach)
  lsp.bash.setup {
    on_attach = on_attach,
    cmd_env = {
      GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
    },
    filetypes = { "sh" },
    root_dir = vim.loop.cwd,
  }
end
