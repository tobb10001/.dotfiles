return {
	"tobb10001/indexcard.nvim",
	config = {
		cards = {
			{
				"Jump to the other end of a selection in visual mode.",
				"`o` - `O` to stay on the same line in visual block mode.",
			}
		}
	},
	dev = true,
	keys = {
		{
			"<leader>it",
			function() require("indexcard").toggle() end,
			mode = { "n", "v" },
			desc = "[I]ndexcard [T]oggle",
		},
		{
			"<leader>in",
			function() require("indexcard").toggle() end,
			mode = { "n", "v" },
			desc = "[I]ndexcard [N]ext",
		},
	}
}
