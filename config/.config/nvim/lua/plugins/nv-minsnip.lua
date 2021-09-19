local present, minsnip = pcall(require, "minsnip")

if not present then
  return
end

_G.tab_complete = function()
  if not minsnip.jump() and vim.fn.pumvisible() == 1 then
    vim.api.nvim_input("<C-n>")
  elseif not minsnip.jump() then
    vim.api.nvim_input("<C-S-i>")
  end
end

_G.s_tab_complete = function()
  if not minsnip.jump_backwards() and vim.fn.pumvisible() == 1 then
    vim.api.nvim_input("<C-p>")
  elseif not minsnip.jump_backwards() then
    vim.api.nvim_command("<")
  end
end

map("i", "<Tab>", "<cmd>lua tab_complete()<CR>", {})
map("i", "<S-Tab>", "<cmd>lua s_tab_complete()<CR>", {})

-- helpers
local from_ft = function(ft)
  ft = type(ft) == "string" and { ft } or ft
  local gen = function(snip)
    if not vim.tbl_contains(ft, vim.bo.ft) then
      return
    end
    return snip
  end
  return gen, function(snip)
    return function()
      return gen(snip)
    end
  end
end

-- filetypes
local lua = from_ft("lua")
local ts = from_ft({"typescript", "vue"})
local js = from_ft({"javascript", "typescript", "vue"})
local html = from_ft({"html", "php", "vue"})

local snippets = {
  -- Lua
  req = function()
    return lua('require "$1"')
  end,
  -- JavaScript/TypeScript/Vue
  cl = function()
    return js("console.log($1);")
  end,
  fun = function ()
    return
      ts([[
      /**
      * $1
      * @author briones-gabriel
      */
      $2($3): $4 {
      $5
      }
      ]])
      or
      js([[
      /**
      * $1
      * @author briones-gabriel
      */
      function $2($3) {
      $4 
      }]])
  end,
  -- HTML/PHP
  div = function ()
    return html("<div>$1</div>")
  end,
  p = function ()
    return html("<p>$1</p>")
  end,
  span = function ()
    return html("<span>$1</span>")
  end,
  button = function ()
    return html("<button>$1</button>")
  end,
  a = function ()
    return html("<a href=\"#\">$1</a>")
  end,
  html = function ()
  	return html([[
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="utf-8">
            <meta name="description" content="description">
            <title></title>
        </head>
        <body>
            $1
        </body>
    </html>
    ]])
  end
}

minsnip.setup(snippets)
