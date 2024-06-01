return {
	{
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
			}
		},
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			inlay_hints = {
				enabled = true,
			},
		},
	},
}
