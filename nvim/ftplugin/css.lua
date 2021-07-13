require("lspconfig").cssls.setup {
	cmd = {
		"node",
		DATA_PATH .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
		"--stdio",
	},
	filetypes = { "css", "scss", "less" },
	on_attach = require("plugins.lsp.on_attatch"),
}
