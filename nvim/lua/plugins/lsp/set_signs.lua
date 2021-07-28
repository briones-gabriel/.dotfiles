return function ()
  local lsp = vim.lsp

  --- ERROR SYMBOL ---
  lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        prefix = "",
        spacing = 0,
      },
      signs = false,
      underline = true,
    }
  )

  --- COMPLETION SYMBOLS ---
  vim.lsp.protocol.CompletionItemKind = {
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
    "   (TypeParameter)",
  }

  --- SIGN DEFINITION ---
  local sign_def = function (sign, icon) fn.sign_define(sign, {text = icon}) end

  sign_def("LspDiagnosticsSignError", "")
  sign_def("LspDiagnosticsSignWarning", "")
  sign_def("LspDiagnosticsSignInformation", "")
  sign_def("LspDiagnosticsSignHint", "")
end
