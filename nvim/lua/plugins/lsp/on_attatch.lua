return function(client, bufnr)
	--- MAPPINGS ---
	vim.api.nvim_buf_set_option(bufnr,     "omnifunc",                           "v:lua.vim.lsp.omnifunc")
	bmap(bufnr,    "n",    "<Leader>e",    ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",     optns)
	bmap(bufnr,    "n",    "<Leader>f",    ":lua vim.lsp.buf.formatting()<CR>",                       optns)
	bmap(bufnr,    "n",    "<C-k>",        ":lua vim.lsp.buf.signature_help()<CR>",                   optns)
	bmap(bufnr,    "n",    "K",            ":lua vim.lsp.buf.hover()<CR>",                            optns)
	bmap(bufnr,    "n",    "gd",           ":lua vim.lsp.buf.definition()<CR>",                       optns)
	bmap(bufnr,    "n",    "gr",           ":lua vim.lsp.buf.references()<CR>",                       optns)
	bmap(bufnr,    "n",    "gD",           ":lua vim.lsp.buf.declaration()<CR>",                      optns)
	bmap(bufnr,    "n",    ";r",           ":lua vim.lsp.buf.rename()<CR>",                           optns)
	bmap(bufnr,    "n",    ";d",           ":lua vim.lsp.buf.type_definition()<CR>",                  optns)
	bmap(bufnr,    "n",    ";a",           ":lua vim.lsp.buf.code_action()<CR>",                      optns)
	bmap(bufnr,    "n",    ";i",           ":lua vim.lsp.buf.implementation()<CR>",                   optns)
	bmap(bufnr,    "n",    ";n",           ":lua vim.lsp.diagnostic.goto_next()<CR>",                 optns)
end
