return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		main = "copilot",
		opts = {
			panel = {
				enabled = true,
				keymap = {
					open = "<C-c>",
				}
			},
			suggestion = {
				keymap = {
					accept = "<M-a>",
					accept_word = "<M-w>",
					accept_line = "<M-l>",
					next = "<M-n>",
					prev = "<M-p>",
					dismiss = "<M-x>",
				},
			},
			filetypes = {
				markdown = false,
				["*"] = true,
			}
		},
	},
	"AndreM222/copilot-lualine",
}
