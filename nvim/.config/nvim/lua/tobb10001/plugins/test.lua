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
		keys = {
			{
				"<leader>tr",
				function()
					require("neotest").run.run()
				end,
				mode = "n",
				desc = "[T]est: [R]un nearest test"
			},
			{
				"<leader>tf",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				mode = "n",
				desc = "[T]est: Run [F]ile"
			},
			{
				"<leader>td",
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				mode = "n",
				desc = "[T]est: [D]ebug nearest test"
			},
			{
				"<leader>tc",
				function()
					require("neotest").run.stop()
				end,
				mode = "n",
				desc = "[T]est: [C]ancel nearest test"
			},
			{
				"<leader>ta",
				function()
					require("neotest").run.attach()
				end,
				mode = "n",
				desc = "[T]est: [A]ttach to nearest test"
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary()
				end,
				mode = "n",
				desc = "[T]est: [S]ummary"
			},
		}
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
