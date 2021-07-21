local present, _ = pcall(require, "luatab")
if not present then
  return
end

vim.o.tabline = '%!v:lua.require\'luatab\'.tabline()'
