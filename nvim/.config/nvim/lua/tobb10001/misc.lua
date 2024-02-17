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

-- Skeletons
vim.cmd([[:autocmd BufNewFile shell.nix 0r ~/.config/nvim/skeletons/shell.nix]])
