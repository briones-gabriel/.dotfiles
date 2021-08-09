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
      update_in_insert = false,
    }
  )

  --- COMPLETION SYMBOLS ---
  local icons = {
    Class       = "   (Class)",
    Color       = "   (Color)",
    Constant    = " ﲀ  (Constant)",
    Constructor = "   (Constructor)",
    Enum        = " 練 (Enum)",
    EnumMember  = "   (EnumMember)",
    Field       = "   (Field)",
    File        = "   (File)",
    Folder      = "   (Folder)",
    Function    = "   (Function)",
    Interface   = " ﰮ  (Interface)",
    Keyword     = "   (Keyword)",
    Method      = "   (Method)",
    Module      = "   (Module)",
    Property    = " 襁 (Property)",
    Snippet     = "   (Snippet)",
    Struct      = " ﳤ  (Struct)",
    Text        = "   (Text) ",
    Unit        = "   (Unit)",
    Value       = "   (Value)",
    Variable    = "  (Variable)",
  }
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = icons[kind] or kind
  end

  --- SIGN DEFINITION ---
  local sign_def = function (sign, icon) fn.sign_define(sign, {text = icon}) end

  sign_def("LspDiagnosticsSignError", "")
  sign_def("LspDiagnosticsSignWarning", "")
  sign_def("LspDiagnosticsSignInformation", "")
  sign_def("LspDiagnosticsSignHint", "")
end
