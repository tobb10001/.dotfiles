vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "justfile", "Justfile" },
	callback = function()
		vim.api.nvim_set_option_value("filetype", "just", { scope = "global" })
	end,
})
