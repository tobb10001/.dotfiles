return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	-- keys = {
	-- 	{
	-- 		"<leader>f",
	-- 		function()
	-- 			require("conform").format({ async = true, lsp_fallback = true })
	-- 		end,
	-- 		mode = "",
	-- 		desc = "Format buffer",
	-- 	},
	-- },
	-- config = function(opts)
	-- 	require("conform").setup(ConformOptions or opts)
	-- end,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
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
