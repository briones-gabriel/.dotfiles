local common_prettier = {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--print-width 120"},
    stdin = true
  }

require("formatter").setup({
  logging = false,
  filetype = {
    javascript = {
      -- prettier
      function ()
        return common_prettier
      end
    },
    typescript = {
      -- prettier
      function()
        return common_prettier
      end
    },
    vue = {
      -- prettier
      function()
        return common_prettier
      end
    },
    html = {
      -- prettier
      function()
        return common_prettier
      end
    },
    css = {
      -- prettier
      function()
        return common_prettier
      end
    },
    scss = {
      -- prettier
      function()
        return common_prettier
      end
    },
    --lua = {
    --  -- luafmt
    --  function()
    --    return {
    --      exe = "luafmt",
    --      args = {"--indent-count", 2, "--stdin"},
    --      stdin = true
    --    }
    --  end
    --},
  }
})
