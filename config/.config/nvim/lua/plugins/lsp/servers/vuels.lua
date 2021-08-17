return {
  cmd = { "vls" },
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
          useScaffoldSnippets = false
        },
        format = {
          options = {
            useTabs = true,
            tabSize = 2,
          },
          defaultFormatter = {
            js = "prettier",
            ts = "prettier",
            html = "prettier",
            css = "prettier",
            scss = "prettier",
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
  root_dir = require("lspconfig").util.root_pattern("package.json", "vue.config.js"),
}
