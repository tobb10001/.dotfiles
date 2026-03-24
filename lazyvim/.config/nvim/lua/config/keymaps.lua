-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<c-.>", "gt")
vim.keymap.set("n", "<c-,>", "gT")

vim.keymap.del("n", "n")
vim.keymap.del("n", "N")
