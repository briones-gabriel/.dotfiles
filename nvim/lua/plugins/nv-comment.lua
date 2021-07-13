require('nvim_comment').setup {
  marker_padding       = false,    -- Linters prefer comment and line to have a space in between markers
  create_mappings      = true,     -- Should key mappings be created
  comment_empty        = true,     -- should comment out empty or whitespace only lines
}
