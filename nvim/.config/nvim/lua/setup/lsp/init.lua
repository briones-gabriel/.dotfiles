local present, _ = pcall(require, 'lspconfig')

if not present then
  return
end

require('setup.lsp.lsp_installer')
require('setup.lsp.handlers').setup()
