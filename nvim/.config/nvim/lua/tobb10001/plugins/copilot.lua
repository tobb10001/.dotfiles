return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		main = "copilot",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		main = "copilot_cmp",
		config = true,
		dependencies = { "zbirenbaum/copilot.lua" },
		event = { "InsertEnter", "LspAttach" },
	}
}
