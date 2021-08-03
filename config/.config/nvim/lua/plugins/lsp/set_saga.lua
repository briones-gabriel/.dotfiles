return function ()
  local saga = require "lspsaga"
  saga.init_lsp_saga {
    max_preview_lines = 4,
    border_style = "round",
    rename_prompt_prefix = "",
    dianostic_header_icon = "",
    code_action_icon = "",
    definition_preview_icon = "",
    use_saga_diagnostic_sign = false,
    code_action_prompt = {
      enable = true,
      sign = false,
      sign_priority = 0,
      virtual_text = true,
    },
  }

  -- Change borders colors
  local borders = {
    "LspFloatWinBorder",
    "LspSagaBorderTitle",
    "LspSagaRenameBorder",
    "LspSagaHoverBorder",
    "LspSagaSignatureHelpBorder",
    "LspSagaCodeActionBorder",
    "LspSagaDefPreviewBorder",
    "LspSagaDiagBorder",
    "ProviderTruncateLine",
    "DiagnosticTruncateLine",
    "LspSagaShTruncateLine",
    "LspSagaDocTruncateLine",
    "LspSagaCodeActionTruncateLine",
  }

  for _, border in ipairs(borders) do
    vim.cmd("hi " .. border .. " guifg=#5E81AC")
  end

  -- Change floating window background color
  vim.cmd([[
  hi LspFloatWinNormal guibg=bg
  ]])

end
