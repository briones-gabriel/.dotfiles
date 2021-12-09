local running, nightfox = pcall(require, "nightfox")

if not running then
  return
end

nightfox.setup({
  fox = "nightfox",
  transparent = false,
  styles = {
    comments = "italic",
  }
})

nightfox.load()
