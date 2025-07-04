local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local function pick_directory_with_oil(opts)
	opts = opts or {}
	local cwd = vim.fn.getcwd()

	-- Use fd to find directories, respecting .gitignore
	local handle = io.popen('fd --type d --hidden --exclude .git --color=never . "' .. cwd .. '"')
	local dirs = {}
	if handle then
		for line in handle:lines() do
			table.insert(dirs, vim.fn.fnamemodify(line, ":p"))
		end
		handle:close()
	end
	table.insert(dirs, 1, cwd) -- Optionally include cwd itself

	-- Convert to relative paths for display
	local rel_dirs = vim.tbl_map(function(dir)
		return vim.fn.fnamemodify(dir, ":.")
	end, dirs)

	pickers
		.new(opts, {
			prompt_title = "Select Directory (Oil)",
			finder = finders.new_table({
				results = rel_dirs,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					local rel_dir = selection[1] or selection.value
					local dir = vim.fn.fnamemodify(rel_dir, ":p")
					require("oil").open(dir)
				end)
				return true
			end,
		})
		:find()
end

local function config()
	pcall(require("telescope").load_extension, "fzf")

	require("telescope").load_extension("luasnip")

	require("telescope").extensions.oil_dirs = {
		oil_dirs = pick_directory_with_oil,
	}
end

local keys = {
	{
		"so",
		function()
			return require("telescope.builtin").oldfiles({ only_cwd = true })
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
		"se",
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
	{
		"sd",
		function()
			require("telescope").extensions.oil_dirs.oil_dirs()
		end,
		mode = "n",
		desc = "[S]earch [D]irectory (Oil)",
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
	cond = not vim.g.vscode,
}
