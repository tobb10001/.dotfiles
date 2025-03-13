local filetypes = {}

local linters_by_ft = {
	javascript = { "eslint" },
	markdown = { "cspell" },
	typescript = { "eslint" },
	yaml = { "yamllint" },
}

for k, _ in pairs(linters_by_ft) do
	filetypes[#filetypes + 1] = k
end

return {
	"mfussenegger/nvim-lint",
	ft = filetypes,
	config = function()
		require("lint").linters_by_ft = linters_by_ft

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
	cond = not vim.g.vscode,
}
