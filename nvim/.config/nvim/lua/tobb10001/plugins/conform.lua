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
	opts = ConformOptions or {
		formatters_by_ft = {
			lua = { "stylua" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = false, -- ruff isn't there yet
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
