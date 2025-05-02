return {
	{
		"klen/nvim-config-local",
		lazy = false,
		config = function()
			require("config-local").setup({
				config_files = { ".nvim.lua" },
				commands_create = true,
			})
		end,
	},
}
