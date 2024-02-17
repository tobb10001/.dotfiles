return {
	dir = "~/Documents/prog/indexcard.nvim",
	opts = {
		cards = {
			{
				"zc - close fold under cursor",
				"zo - open fold under cursor",
			},
			{
				"dd - delete a line",
			},
		},
	},
	keys = {
		{
			"<leader>it",
			function()
				require("indexcard").toggle()
			end,
			mode = "n",
			desc = "[I]ndexcard [T]oggle ",
		},
		{
			"<leader>in",
			function()
				require("indexcard").next()
			end,
			mode = "n",
			desc = "[I]ndexcard [N]ext",
		},
		{
			"<leader>ip",
			function()
				require("indexcard").prev()
			end,
			mode = "n",
			desc = "[I]ndexcard [P]revious",
		},
	},
}
