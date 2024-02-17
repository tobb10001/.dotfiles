return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",

		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-python",
	},
	config = function()
		local neotest_ns = vim.api.nvim_create_namespace("neotest")
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					return diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
				end,
			},
		}, neotest_ns)
		require("neotest").setup({
			adapters = {
				require("neotest-go"),
				require("neotest-python"),
			},
		})
	end,
	keys = {
		{
			"<leader>tt",
			function()
				return require("neotest").run.run()
			end,
			mode = "n",
			desc = "Run the nearest test",
		},
		{
			"<leader>tf",
			function()
				return require("neotest").run.run(vim.fn.expand("%"))
			end,
			mode = "n",
			desc = "Run current file",
		},
	},
}
