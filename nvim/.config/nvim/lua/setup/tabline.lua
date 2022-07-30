vim.cmd [[
  highlight Mode guibg=#95CEDA guifg=#000000 gui=bold
  highlight FileName guibg=#205057 guifg=#FFFFFF
  highlight GitBranch guibg=#152528 guifg=#FF9F78
]]

local function project_root_dir()
  return "%#FileName# " .. vim.fn.substitute(vim.fn.getcwd(), '^.*/', '', '') .. "/" .. " %#Normal#"
end

Tabline = {}

function Tabline.active()
  return project_root_dir()
end

vim.api.nvim_exec([[
  augroup Tabline
  au!
  au WinEnter,BufEnter * setlocal tabline=%!v:lua.Tabline.active()
  augroup END
]], false)
