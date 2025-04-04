return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true }, function(err)
					if not err then
						local mode = vim.api.nvim_get_mode().mode
						if vim.startswith(string.lower(mode), "v") then
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
						end
					else
						vim.notify("Error when formatting: " .. vim.inspect(err), vim.log.levels.ERROR)
					end
				end)
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	-- config = function(opts)
	-- 	require("conform").setup(ConformOptions or opts)
	-- end,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			markdown = { "prettier" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			timeout_ms = 500
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	cond = not vim.g.vscode,
}
