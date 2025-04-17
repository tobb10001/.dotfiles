return {
	"pmizio/typescript-tools.nvim",
	ft = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue" },
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {
		filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
		settings = {
			tsserver_file_preferences = {
				includeInlayParameterNameHints = "all",
			},
			tsserver_format_options = {
				indentSize = 2,
			},
			tsserver_plugins = {
				"@vue/typescript-plugin",
			}
		},
	},
	cond = not vim.g.vscode,
}
