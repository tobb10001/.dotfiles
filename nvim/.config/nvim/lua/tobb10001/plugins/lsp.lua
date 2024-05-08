return {
	{
		"neovim/nvim-lspconfig",
		config = require("tobb10001.lsp").lspconfig_config,
		dependencies = {
			{
				"folke/neodev.nvim",
				opts = {},
			},
			{
				"SmiteshP/nvim-navbuddy",
				dependencies = {
					"SmiteshP/nvim-navic",
					"MunifTanjim/nui.nvim",
				},
				opts = { lsp = { auto_attach = true } },
			},
			{
				"simrat39/symbols-outline.nvim",
				config = true,
				event = { "BufReadPost", "BufNewFile" },
			},
			"onsails/lspkind.nvim",
			"VidocqH/lsp-lens.nvim",
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
				"kosayoda/nvim-lightbulb",
				config = function()
					require("nvim-lightbulb").setup({
						autocmd = { enabled = true },
					})
				end,
			},
			"mfussenegger/nvim-jdtls",
		},
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			inlay_hints = {
				enabled = true,
			},
		},
	},
	{
		"zeioth/garbage-day.nvim",
		dependencies = "neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {
			grace_period = 60 * 5,
		},
	},
}
