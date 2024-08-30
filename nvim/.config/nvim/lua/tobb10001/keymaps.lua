-- [[ Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Escape to escape from terminals.
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Faster escape from insert mode
vim.keymap.set("i", "kj", "<Esc>")

-- Type german letters
vim.keymap.set("i", "aee", "ä")
vim.keymap.set("i", "oee", "ö")
vim.keymap.set("i", "uee", "ü")
vim.keymap.set("i", "Aee", "Ä")
vim.keymap.set("i", "Oee", "Ö")
vim.keymap.set("i", "Uee", "Ü")
vim.keymap.set("i", "sss", "ß")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
vim.keymap.set("n", "<leader>td", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end,
	{ desc = "[T]oggle [d]iagnostics" })

-- Quickfix list
vim.keymap.set("n", "[c", function()
	vim.cmd(":cprev")
end, { desc = "Previos quickfix item." })
vim.keymap.set("n", "]c", function()
	vim.cmd(":cnext")
end, { desc = "Next quickfix item." })
vim.keymap.set("n", "<leader>co", function() vim.cmd(":copen") end, { desc = "Open quickfix list" })
vim.keymap.set("n", "<leader>cc", function() vim.cmd(":cclose") end, { desc = "Close quickfix list" })
