return function (lsp, on_attach, capabilities)
  lsp.lua.setup {
    flags = {
      debounce_text_changes = 500,
    },
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = vim.loop.cwd,
    settings = {
      Lua = {
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          },
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }
end
