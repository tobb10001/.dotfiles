return {
	"mfussenegger/nvim-lint",
	ft = { "python" },
	config = function()
		require("lint").linters_by_ft = {
			python = { "mypy", "ruff" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
