vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.tex" },
	callback = function()
		vim.api.nvim_set_option_value("filetype", "tex", { scope = "global" })
	end,
})
