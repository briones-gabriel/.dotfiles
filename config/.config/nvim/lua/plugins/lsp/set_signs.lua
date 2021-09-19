return function ()
  local lsp = vim.lsp
  local handlers = lsp.handlers

  --- ERROR SYMBOL ---
  handlers["textDocument/publishDiagnostics"] = lsp.with(
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

  handlers["textDocument/hover"] = lsp.with(handlers.hover, {border = borders})
  handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, {border = borders})

  --- SIGN DEFINITION ---
  local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

  for type, icon in pairs(signs) do
    local hl = "LspDiagnosticsSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end
