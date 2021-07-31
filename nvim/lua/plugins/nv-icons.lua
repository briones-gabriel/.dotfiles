require"nvim-web-devicons".setup {
  -- your personnal icons can go here (to override)
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      name = "Zsh"
    },
    js = {
      icon = "",
      name = "JavaScript"
    },
    ts = {
      icon = "",
      name = "TypeScript"
    },
    html = {
      icon = "",
      name = "HTML"
    },
    css = {
      icon = "",
      name = "CSS"
    },
  };
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  -- default = true;
}
