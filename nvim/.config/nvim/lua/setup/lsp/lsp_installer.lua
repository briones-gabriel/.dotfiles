local present, lsp_installer = pcall(require, 'nvim-lsp-installer')

if not present then
  return
end

lsp_installer.on_server_ready(
  function(server)
    local handlers = require('setup.lsp.handlers')

    local opts = {
      on_attach = handlers.on_attach,
      capabilities = handlers.capabilities,
    }

    local settings_are_present, settings = pcall(require, 'setup.lsp.settings.' .. server.name)

    if settings_are_present then
      opts = vim.tbl_deep_extend('force', settings, opts)
    end

    server:setup(opts)
  end
)
