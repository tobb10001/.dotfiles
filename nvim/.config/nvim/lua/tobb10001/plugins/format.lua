local filetype = function()
	return {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		markdown = {
			require("formatter.defaults.prettier"),
		},
		python = {
			require("formatter.filetypes.python").black,
		},
	}
end

local format = function()
	if vim.fn.expand("%"):find("oil://", 1, true) == 1 then
		return
	end
	if filetype()[vim.bo.filetype] ~= nil then
		vim.cmd(":Format")
	else
		vim.lsp.buf.format()
	end
end

local format_write = function()
	if vim.fn.expand("%"):find("oil://", 1, true) == 1 then
		return
	end
	if filetype()[vim.bo.filetype] ~= nil then
		vim.cmd(":FormatWrite")
	else
		vim.lsp.buf.format()
		vim.cmd(":w")
	end
end

return {
	"mhartington/formatter.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("formatter").setup({
			filetype = filetype(),
		})
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = format_write,
		})
	end,
	keys = {
		-- https://github.com/mhartington/formatter.nvim/issues/260#issuecomment-1646573031
		{ "<leader>f", format, desc = "[F]ormat", silent = true },
		{ "<leader>F", format_write, desc = "[F]ormat and write", silent = true },
	},
}
