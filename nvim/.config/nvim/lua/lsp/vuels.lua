return {
  init_options = {
    config = {
      vetur = {
        completion = {
          autoImport = true,
          tagCasing = "kebab",
          useScaffoldSnippets = true
        },
        format = {
          defaultFormatter = {
            js = "prettier",
            ts = "prettier"
          },
          scriptInitialIndent = true,
          styleInitialIndent = false
        },
        ignoreProjectWarning = true,
      },
    },
  },
}
