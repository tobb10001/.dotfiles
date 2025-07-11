ENABLED = true

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
				},
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
			},
		},
		enabled = ENABLED,
	},
	{
		"AndreM222/copilot-lualine",
		event = "VeryLazy",
		enabled = ENABLED,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		version = "*",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- window = {
			-- 	layout = "float",
			-- 	width = 0.8,
			-- 	height = 0.8,
			-- },
		},
		-- See Commands section for default commands if you want to lazy load on them
		event = "VeryLazy",
		keys = {
			{
				"<leader>cc",
				function()
					require("CopilotChat").toggle()
				end,
				mode = { "n", "v" },
				desc = "Toggle [C]opilot[C]hat",
			},
			{
				"<leader>cr",
				function()
					require("CopilotChat").reset()
				end,
				desc = "[R]eset [C]opilotChat",
			},
			{
				"<leader>cp",
				function()
					require("CopilotChat").select_prompt()
				end,
				mode = { "n", "v" },
			},
		},
		enabled = ENABLED,
	},
}
