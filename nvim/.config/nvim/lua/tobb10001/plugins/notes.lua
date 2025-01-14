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
			"<leader>sf",
			function()
				vim.cmd(":ScribeFind")
			end,
			desc = "[S]cribe [F]ind note",
		},
		{
			"<leader>sn",
			function()
				vim.cmd(":ScribeNew")
			end,
			desc = "[S]cribe [N]ew note",
		},
		{
			"<leader>so",
			function()
				vim.cmd(":ScribeOpen")
			end,
			desc = "[S]cribe [O]pen notes",
		},
	},
}
