local common_prettier = {
  exe = "prettier",
  args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--print-width 120"},
  stdin = true
}

require("formatter").setup({
  logging = false,
  filetype = {
    javascript = {
      function ()
        return common_prettier
      end
    },
    json = {
      function ()
        return common_prettier
      end
    },
    typescript = {
      function()
        return common_prettier
      end
    },
    vue = {
      function()
        return common_prettier
      end
    },
    html = {
      function()
        return common_prettier
      end
    },
    css = {
      function()
        return common_prettier
      end
    },
    scss = {
      function()
        return common_prettier
      end
    },
    php = {
      function ()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--print-width 120", "--write"},
          stdin = true
        }
      end
    },
  }
})
