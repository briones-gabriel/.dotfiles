local present, nvim_comment = pcall(require, "nvim_comment")

if not present then
  return
end

nvim_comment.setup {
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = false,
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- Should key mappings be created
  create_mappings = false,
  -- Hook function to call before commenting takes place
  hook = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
}
