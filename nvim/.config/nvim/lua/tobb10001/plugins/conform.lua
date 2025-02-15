local file = io.open("./log", "w")
io.write(vim.inspect(ConformOptions))
io.close(file)

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	config = function(opts)
		require("conform").setup(ConformOptions or opts)
	end,
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
		},
		format_on_save = {
			lsp_format = "fallback",
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	cond = not vim.g.vscode,
}
