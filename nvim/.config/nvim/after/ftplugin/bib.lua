vim.cmd(":set textwidth=0")
vim.cmd(":set foldmethod=expr")
vim.cmd(":set foldminlines=0")

vim.keymap.set("n", "<leader>u", function()
	-- Construct new line.
	local date = os.date("%Y-%m-%d")
	local line = "urldate = {" .. date .. "},"

	-- Insert new line.
	local buf = vim.api.nvim_get_current_buf()
	local win = vim.api.nvim_get_current_win()
	local cur = vim.api.nvim_win_get_cursor(win)
	local row = cur[1]

	vim.api.nvim_buf_set_lines(buf, row, row, false, { line })
	vim.api.nvim_win_set_cursor(win, { cur[1] + 1, cur[2] })

	-- Align new line.
	vim.fn.feedkeys("==")
end, { desc = "Add [u]rldate" })
