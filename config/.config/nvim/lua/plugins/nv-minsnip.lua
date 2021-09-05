local present, minsnip = pcall(require, "minsnip")

if not present then
  return
end

_G.tab_complete = function()
    if not minsnip.jump() then
        vim.api.nvim_input("<C-x><C-o>")
    end
end

map("i", "<C-l>", "<cmd>lua tab_complete()<CR>", {})

local snippets = {
  -- Lua
  req = function()
    return vim.bo.ft == "lua" and 'require "$1"'
  end,
  -- JavaScript/TypeScript/Vue
  cl = function()
    if vim.bo.ft == "javascript" or vim.bo.ft == "typescript" or vim.bo.ft == "vue" then
      return "console.log($1);"
    end
  end,
  fun = function ()
    if vim.bo.ft == "typescript" or vim.bo.ft == "vue" then
      return [[
      /**
       * $1
       * @author briones-gabriel
       */
      $2($3): $4 {
        $5
      }
      ]]
    elseif vim.bo.ft == "javascript" then
      return [[
      /**
       * $1
       * @author briones-gabriel
       */
      function $2($3) {
        $4 
      }]]
    end
  end,
  -- HTML/PHP
  div = function ()
    if vim.bo.ft == "htm" or vim.bo.ft == "php" then
      return "<div>$1</div>"
    end
  end,
  p = function ()
    if vim.bo.ft == "htm" or vim.bo.ft == "php" then
      return "<p>$1</p>"
    end
  end,
  span = function ()
    if vim.bo.ft == "htm" or vim.bo.ft == "php" then
      return "<span>$1</span>"
    end
  end,
  button = function ()
    if vim.bo.ft == "htm" or vim.bo.ft == "php" then
      return "<button>$1</button>"
    end
  end,
  a = function ()
    if vim.bo.ft == "htm" or vim.bo.ft == "php" then
      return "<a href=\"#\">$1</a>"
    end
  end,
}

minsnip.setup(snippets)
