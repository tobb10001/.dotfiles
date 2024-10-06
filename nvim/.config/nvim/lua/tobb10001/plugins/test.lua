return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- Adapters
			"nvim-neotest/neotest-python",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")
				}
			})
		end,
	},
	{
		"andythigpen/nvim-coverage",
		dependencies = { "nvim-lua/plenary.nvim" },
		rocks = { "lua-xmlreader" },
		opts = {
			auto_reload = true,
		},
		cmd = {
			"Coverage",
		},
	}
}
