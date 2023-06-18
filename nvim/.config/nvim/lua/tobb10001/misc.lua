-- Smart switch between absolute and relative line numbers.
vim.api.nvim_create_autocmd(
	{ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" },
	{
		callback = function()
			if vim.wo.number and vim.fn.mode() ~= 'i' then
				vim.wo.relativenumber = true
			end
		end
	}
)
vim.api.nvim_create_autocmd(
	{ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
	{
		callback = function()
			if vim.wo.number then
				vim.wo.relativenumber = false
			end
		end
	}
)
