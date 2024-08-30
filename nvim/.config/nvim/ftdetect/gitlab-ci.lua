vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.gitlab-ci.yml" },
	callback = function()
		vim.api.nvim_set_option_value("filetype", "yaml.gitlab-ci", { scope = "global" })
	end,
})
