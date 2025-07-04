return {
	{
		"neovim/nvim-lspconfig",
		config = require("tobb10001.lsp").lspconfig_config,
		dependencies = {
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
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "barreiroleo/ltex_extra.nvim" },
	{ "artemave/workspace-diagnostics.nvim" },
	-- {
	-- 	'nvimdev/lspsaga.nvim',
	-- 	opts = {
	-- 		lightbulb = { enabled = false },
	-- 	},
	-- 	dependencies = {
	-- 		'nvim-treesitter/nvim-treesitter', -- optional
	-- 		'nvim-tree/nvim-web-devicons', -- optional
	-- 	}
	-- }
}
