return function (lsp, _, _)
  local util = lsp.util

  local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
  }

  lsp.efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"javascript", "typescript"},
    root_dir = function(fname)
      return util.root_pattern("tsconfig.json")(fname) or
        util.root_pattern(".eslintrc.js", ".git")(fname);
    end,
    settings = {
      rootMarkers = {".eslintrc.js", ".git/"},
      languages = {
        javascript = {eslint},
        typescript = {eslint}
      }
    }
  }
end
