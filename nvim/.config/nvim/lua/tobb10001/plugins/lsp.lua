return {
	"neovim/nvim-lspconfig",
	config = require("tobb10001.lsp").lspconfig_config,
	dependencies = {
		{ "folke/lazydev.nvim", opts = {} },
		{
			"simrat39/symbols-outline.nvim",
			config = true,
			event = { "BufReadPost", "BufNewFile" },
		},
		"onsails/lspkind.nvim",
		{
			"klen/nvim-config-local",
			lazy = false,
			config = function()
				require("config-local").setup({
					config_files = { ".nvim.lua" },
					commands_create = true,
				})
			end,
		},
		{
			"mfussenegger/nvim-jdtls",
			ft = { "java" },
		},
		-- {
		-- 	"VidocqH/lsp-lens.nvim",
		-- 	config = {
		-- 		target_symbol_kinds = {
		-- 			vim.lsp.protocol.SymbolKind.Class,
		-- 			vim.lsp.protocol.SymbolKind.Function,
		-- 			vim.lsp.protocol.SymbolKind.Interface,
		-- 			vim.lsp.protocol.SymbolKind.Method,
		-- 			vim.lsp.protocol.SymbolKind.Struct,
		-- 		}
		-- 	},
		-- }
	},
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		inlay_hints = {
			enabled = true,
		},
	},
	cond = not vim.g.vscode,
}
