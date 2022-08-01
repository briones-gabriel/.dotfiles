local modes = {
  ['n']     = 'NORMAL',
  ['no']    = 'O-PENDING',
  ['nov']   = 'O-PENDING',
  ['noV']   = 'O-PENDING',
  ['no\22'] = 'O-PENDING',
  ['niI']   = 'NORMAL',
  ['niR']   = 'NORMAL',
  ['niV']   = 'NORMAL',
  ['nt']    = 'NORMAL',
  ['v']     = 'VISUAL',
  ['vs']    = 'VISUAL',
  ['V']     = 'V-LINE',
  ['Vs']    = 'V-LINE',
  ['\22']   = 'V-BLOCK',
  ['\22s']  = 'V-BLOCK',
  ['s']     = 'SELECT',
  ['S']     = 'S-LINE',
  ['\19']   = 'S-BLOCK',
  ['i']     = 'INSERT',
  ['ic']    = 'INSERT',
  ['ix']    = 'INSERT',
  ['R']     = 'REPLACE',
  ['Rc']    = 'REPLACE',
  ['Rx']    = 'REPLACE',
  ['Rv']    = 'V-REPLACE',
  ['Rvc']   = 'V-REPLACE',
  ['Rvx']   = 'V-REPLACE',
  ['c']     = 'COMMAND',
  ['cv']    = 'EX',
  ['ce']    = 'EX',
  ['r']     = 'REPLACE',
  ['rm']    = 'MORE',
  ['r?']    = 'CONFIRM',
  ['!']     = 'SHELL',
  ['t']     = 'TERMINAL',
}

vim.cmd [[
  highlight Mode guibg=#95CEDA guifg=#000000 gui=bold
  highlight FileName guibg=#205057 guifg=#FFFFFF
  highlight GitBranch guibg=#0f1c1e guifg=#FF9F78
]]

local function get_mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return "%#Mode#" .. string.format(" %s ", modes[current_mode]):upper() .. "%#StatusLine#"
end

local function get_branch()
  local branch

  if not vim.b.gitsigns_status_dict or not vim.b.gitsigns_status_dict.head then
    branch = ''
  else
    branch = " " .. vim.b.gitsigns_status_dict.head .. " "
  end

  return branch
end

local function get_separator()
  return "%="
end

local function get_file()
  local filename = vim.fn.expand("%:.")

  local exceptions = {
    ["NvimTree_1"] = true,
    ["harpoon-menu"] = true,
  }

  if exceptions[filename] then
    return ""
  else
    return " " .. filename .. " "
  end
end

Statusline = {}

Statusline.active = function()
  return table.concat {
    get_mode(),
    get_file(),
    get_separator(),
    get_branch(),
  }
end

function Statusline.inactive()
  return " %F"
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  augroup END
]], false)
