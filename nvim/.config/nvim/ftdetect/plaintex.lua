vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.tex" },
	callback = function(ev)
		vim.api.nvim_buf_set_option(ev.buf, "filetype", "tex")
	end,
})
