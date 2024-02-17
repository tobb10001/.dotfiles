vim.cmd(":set expandtab")
vim.cmd(":set tabstop=4")
vim.cmd(":set softtabstop=4")
vim.cmd(":set shiftwidth=4")

vim.keymap.set("n", "<leader>so", function()
	vim.cmd(":so %")
end, { desc = "[So]urce the current file." })
