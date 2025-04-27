return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	lazy = true,
	event = {
		"BufReadPre ~/Documents/notes/",
		"BufNewFile ~/Documents/notes",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/Documents/notes/",
			},
		},
	},
	completion = {
		nvim_cmp = false,
		blink = true,
	},
}
