local present, luasnip = pcall(require, "luasnip")
if not present then
  return
end

luasnip.config.set_config(
  {
    history = true,
    updateevents = "InsertLeave"
  }
)
require("luasnip/loaders/from_vscode").load({
  include = {
    "vue",
    "typescript",
    "javascript",
    "html",
    "java",
    "lua",
    "php",
    "sql",
  }
})
