local present, _ = pcall(require, "indent_blankline")
if not present then
  return
end

--- SETTINGS ---
g.indent_blankline_show_current_context    = true
g.indent_blankline_use_treesitter          = false
g.indent_blankline_show_first_indent_level = false
g.indent_blankline_char                    = "▏"

--- FILETYPES ---
g.indent_blankline_filetype = {
  "lua",
  "ts",
  "js",
  "html",
  "css",
  "scss",
  "php",
  "tsx",
  "jsx",
  "java",
}
