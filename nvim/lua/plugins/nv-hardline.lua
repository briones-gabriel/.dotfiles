local present, _ = pcall(require, "hardline")
if not present then
  return
end

require('hardline').setup {
  bufferline = true,  -- enable bufferline
  theme = 'gruvbox',   -- change theme
  sections = {         -- define sections
    {class = 'mode', item = require('hardline.parts.mode').get_item},
    '%<',
    {class = 'med', item = require('hardline.parts.filename').get_item, hide = 240},
    {class = 'med', item ='%='},
    {class = 'error', item = require('hardline.parts.lsp').get_error},
    {class = 'warning', item = require('hardline.parts.lsp').get_warning},
    {class = 'high', item = require('hardline.parts.git').get_item, hide = 80},
    --{class = 'low', item = require('hardline.parts.wordcount').get_item, hide = 80},
    --{class = 'warning', item = require('hardline.parts.whitespace').get_item},
    --{class = 'high', item = require('hardline.parts.filetype').get_item, hide = 80},
    --{class = 'mode', item = require('hardline.parts.line').get_item},
  },
  bufferline_settings = {
    exclude_terminal = false,  -- don't show terminal buffers in bufferline
    show_index = false,        -- show buffer indexes (not the actual buffer numbers) in bufferline
  },
}
