return {
	{
		"neovim/nvim-lspconfig",
		config = require("tobb10001.lsp").lspconfig_config,
		dependencies = {
			{
				"simrat39/symbols-outline.nvim",
				config = true,
				event = { "BufReadPost", "BufNewFile" },
			},
			"onsails/lspkind.nvim",
		},
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			inlay_hints = {
				enabled = true,
			},
		},
		cond = not vim.g.vscode,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } }
			}
		}
	},
	{
		"barreiroleo/ltex_extra.nvim",
	},
}
