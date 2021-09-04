local present, formatter = pcall(require, "formatter")

if not present then
  return
end

local prettier = {
  function ()
    return {
      exe = "prettier",
      args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--print-width 120"},
      stdin = true
    }
  end
}

formatter.setup({
  logging = false,
  filetype = {
    javascript = prettier,
    json = prettier,
    typescript = prettier,
    vue = prettier,
    html = prettier,
    css = prettier,
    scss = prettier,
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
