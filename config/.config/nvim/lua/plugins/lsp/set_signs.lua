return function ()
  local lsp = vim.lsp
  vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
  vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

  --- ERROR SYMBOL ---
  lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
    lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = {
        prefix = "",
        spacing = 0,
      },
      signs = false,
      underline = true,
      update_in_insert = true,
    }
  )
  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = borders})
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = borders})

  --- SIGN DEFINITION ---
  local sign_def = function (sign, icon) fn.sign_define(sign, {text = icon}) end

  sign_def("LspDiagnosticsSignError", "")
  sign_def("LspDiagnosticsSignWarning", "")
  sign_def("LspDiagnosticsSignInformation", "")
  sign_def("LspDiagnosticsSignHint", "")
end
