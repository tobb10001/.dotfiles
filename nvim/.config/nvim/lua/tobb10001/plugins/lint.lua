local filetypes = {}

for k, _ in pairs(LintersByFt) do
	filetypes[#filetypes + 1] = k
end
return {
	"mfussenegger/nvim-lint",
	ft = filetypes,
	config = function()
		require("lint").linters_by_ft = LintersByFt

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
