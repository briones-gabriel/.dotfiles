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
      color = "#F7E01D",
      name = "JavaScript"
    },
    ts = {
      icon = "",
      color = "#3078C6",
      name = "TypeScript"
    },
    html = {
      icon = "",
      color = "#E24E25",
      name = "HTML"
    },
    css = {
      icon = "",
      color = "#0377BD",
      name = "CSS"
    },
  };
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  -- default = true;
}
