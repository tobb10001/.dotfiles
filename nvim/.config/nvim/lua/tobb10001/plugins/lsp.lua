return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"onsails/lspkind.nvim",
			"artemave/workspace-diagnostics.nvim",
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
