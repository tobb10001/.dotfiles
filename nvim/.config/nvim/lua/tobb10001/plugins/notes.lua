return {
	"ostralyan/scribe.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		directory = os.getenv("HOME") .. "/Documents/notes/",
		file_ext = ".md",
		default_file = "scribe",
	},
	cmd = { "ScribeFind", "ScribeNew", "ScribeOpen" },
	keys = {
		{
			"<leader>nf",
			function()
				vim.cmd(":ScribeFind")
			end,
			{ desc = "[F]ind [N]ote" },
		},
		{
			"<leader>nn",
			function()
				vim.cmd(":ScribeNew")
			end,
			{ desc = "[N]ew [N]ote" },
		},
		{
			"<leader>no",
			function()
				vim.cmd(":ScribeOpen")
			end,
			{ desc = "[O]pen [N]otes" },
		},
	},
}
