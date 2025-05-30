-- Smart switch between absolute and relative line numbers.
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
	callback = function()
		if vim.wo.number and vim.fn.mode() ~= "i" then
			vim.wo.relativenumber = true
		end
	end,
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
	callback = function()
		if vim.wo.number then
			vim.wo.relativenumber = false
		end
	end,
})

-- Print stuff quickly.
-- Stolen from https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/globals.lua
function P(v)
	print(vim.inspect(v))
	return v
end

-- Open `help` in a vertical split
-- autocmd FileType help wincmd L
vim.api.nvim_create_autocmd("FileType", { pattern = "help", callback = function() vim.cmd.wincmd("H") end })

-- Configure diagnostics
vim.diagnostic.config({
	underline = true,
	virtual_text = false,
	virtual_lines = { current_line = true },
	float = false,
	signs = true,
	severity_sort = true,
})
