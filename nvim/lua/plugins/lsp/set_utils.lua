return function ()
  local present, _ = pcall(require, "lsputil.codeAction")

  if not present then
    return
  end

  local lsp = vim.lsp

  lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
  lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
  lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
  lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
end
