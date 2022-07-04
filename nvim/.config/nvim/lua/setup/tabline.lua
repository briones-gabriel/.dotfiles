vim.cmd [[
  highlight Mode guibg=#95CEDA guifg=#000000 gui=bold
  highlight FileName guibg=#205057 guifg=#FFFFFF
  highlight GitBranch guibg=#152528 guifg=#FF9F78
]]

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
    return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
    return ""
  end
  return fname .. " "
end

local function file()
  return "%#FileName#" .. filepath() .. filename() .. "%#Normal#"
end

Tabline = {}

function Tabline.active()
  return file()
end

vim.api.nvim_exec([[
  augroup Tabline
  au!
  au WinEnter,BufEnter * setlocal tabline=%!v:lua.Tabline.active()
  augroup END
]], false)
