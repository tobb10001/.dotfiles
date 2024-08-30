-- https://github.com/kskn1/aql-vim
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.aql" },
	callback = function()
		vim.api.nvim_set_option_value("filetype", "aql", { scope = "global" })
	end,
})
