return function ()
  local lsp = vim.lsp

  --- ERROR SYMBOL ---
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        prefix = "",
        spacing = 0,
      },
      signs = true,
      underline = true,
    }
  )

  --- LSP UTILS ---
  lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
  lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
  lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
  lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
  lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
  lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
  lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
  lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler

  --- COMPLETION SYMBOL ---
  require("vim.lsp.protocol").CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
  }

  --- SIGN DEFINITION ---
  local sdef = function (...)
    fn.sign_define(...)
  end

  sdef(
    "LspDiagnosticsSignError",
    {
      text = "",
      numhl = "LspDiagnosticsDefaultError"
    }
  )

  sdef(
    "LspDiagnosticsSignWarning",
    {
      text = "",
      numhl = "LspDiagnosticsDefaultWarning"
    }
  )

  sdef(
    "LspDiagnosticsSignInformation",
    {
      text = "",
      numhl = "LspDiagnosticsDefaultInformation"
    }
  )

  sdef(
    "LspDiagnosticsSignHint",
    {
      text = "",
      numhl = "LspDiagnosticsDefaultHint"
    }
  )
end
