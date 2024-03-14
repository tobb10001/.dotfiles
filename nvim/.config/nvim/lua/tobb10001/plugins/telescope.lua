local function config()
	pcall(require("telescope").load_extension, "fzf")

	require("telescope").load_extension("luasnip")
end

local keys = {
	{
		"so",
		function()
			return require("telescope.builtin").oldfiles()
		end,
		mode = "n",
		desc = "[S]earch [o]ld files",
	},
	{
		"sb",
		function()
			return require("telescope.builtin").buffers()
		end,
		mode = "n",
		desc = "[S]earch [B]uffers",
	},
	{
		"<leader>/",
		function()
			return require("telescope.builtin").current_buffer_fuzzy_find()
		end,
		mode = "n",
		desc = "Fuzzily find in current buffer.",
	},
	{
		"sd",
		function()
			return require("telescope.builtin").diagnostics()
		end,
		mode = "n",
		desc = "[S]earch [D]iagnostics",
	},
	{
		"sa",
		function()
			return require("telescope.builtin").find_files({ hidden = true })
		end,
		mode = "n",
		desc = "[S]earch [A]ll files",
	},
	{
		"sf",
		function()
			return require("telescope.builtin").git_files({ hidden = true })
		end,
		mode = "n",
		desc = "[S]earch [F]iles",
	},
	{
		"sg",
		function()
			return require("telescope.builtin").live_grep({ additional_args = { "-." } })
		end,
		mode = "n",
		desc = "[S]earch by [G]rep",
	},
	{
		"sh",
		function()
			return require("telescope.builtin").help_tags()
		end,
		mode = "n",
		desc = "[S]earch [H]help tags",
	},
	{
		"ss",
		function()
			vim.cmd(":Telescope luasnip")
		end,
		mode = "n",
		desc = "[S]earch [s]nippets",
	},
	{
		"sw",
		function()
			return require("telescope.builtin").lsp_dynamic_workspace_symbols()
		end,
		mode = "n",
		desc = "[S]earch LSP [W]orkspace Symbols",
	},
}

return {
	"nvim-telescope/telescope.nvim",
	opts = {
		defaults = {
			mappings = {
				i = {
					-- map actions.which_key to <C-h> (default: <C-/>)
					-- actions.which_key shows the mappings for your picker,
					-- e.g. git_{create, delete, ...}_branch for the git_branches picker
					["<C-h>"] = "which_key",
					["<C-q>"] = function()
						require("telescope").actions.send_selected_to_qflis()
					end,
				},
			},
		},
	},
	config = config,
	keys = keys,
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		{
			"benfowler/telescope-luasnip.nvim",
			module = "telescope._extensions.luasnip",
		},
	},
}
