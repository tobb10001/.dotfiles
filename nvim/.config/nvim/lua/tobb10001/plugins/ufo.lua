return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"neovim/nvim-lspconfig",
	},
	config = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		require("ufo").setup({
			provider_selector = function()
				return { "lsp", "treesitter" }
			end,
		})
	end,
	event = "VeryLazy",
	keys = {
		{
			"zR",
			function()
				require("ufo").openAllFolds()
			end,
			{ desc = "Open All Folds" },
		},
		{
			"zM",
			function()
				require("ufo").closeAllFolds()
			end,
			{ desc = "Close All Folds" },
		},
	},
	enabled = false,
}
