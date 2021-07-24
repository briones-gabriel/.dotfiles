return function (lsp, on_attach)
  lsp.vue.setup {
    on_attach = on_attach,
    filetypes = { "vue" },
    init_options = {
      config = {
        css = {},
        emmet = {},
        html = {
          suggest = {}
        },
        javascript = {
          format = {}
        },
        stylusSupremacy = {},
        typescript = {
          format = {}
        },
        vetur = {
          ignoreProjectWarning = true,
          completion = {
            autoImport = true,
            tagCasing = "kebab",
            useScaffoldSnippets = true,
          },
          format = {
            defaultFormatter = {
              js = "none",
              ts = "none"
            },
            defaultFormatterOptions = {},
            scriptInitialIndent = false,
            styleInitialIndent = false
          },
          useWorkspaceDependencies = false,
          validation = {
            script = true,
            style = true,
            template = true
          }
        }
      }
    },
    root_dir = lsp.util.root_pattern("package.json", "vue.config.js")
  }
end
