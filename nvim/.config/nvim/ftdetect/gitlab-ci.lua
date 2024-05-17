vim.cmd("au BufRead,BufNewFile *.gitlab-ci.yml set filetype=yaml.gitlab-ci")
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.gitlab-ci.yml" },
	callback = function(ev)
		vim.api.nvim_buf_set_option(ev.buf, "filetype", "yaml.gitlab-ci")
	end,
})
