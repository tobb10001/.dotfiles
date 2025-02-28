return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "VeryLazy",
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
	{
		"AndreM222/copilot-lualine",
		event = "VeryLazy",
	},
	{
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			dependencies = {
				{ "zbirenbaum/copilot.lua" },
				{ "nvim-lua/plenary.nvim", branch = "master" },
			},
			build = "make tiktoken", -- Only on MacOS or Linux
			opts = {
				-- See Configuration section for options
			},
			-- See Commands section for default commands if you want to lazy load on them
			event = "VeryLazy",
		},
	},
}
