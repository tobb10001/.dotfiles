-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Escape to escape from terminals.
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- [[ Plugins ]]

-- Oil
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

-- Rest.Nvim
vim.keymap.set('n', '<leader>rr', require('rest-nvim').run, { desc = "Run the request under the cursor." })
vim.keymap.set('n', '<leader>rp', function() require('rest-nvim').run(true) end,
  { desc = "Preview the request cURL command." })
vim.keymap.set('n', '<leader>rl', require('rest-nvim').last, { desc = "Re-run the last request." })

-- Run a test file
vim.keymap.set('n', '<leader>t', '<Plug>PlenaryTestFile { minimal_init = "tests/minimal_init.vim" }')

-- Type german letters
vim.keymap.set('i', 'aee', 'ä')
vim.keymap.set('i', 'oee', 'ö')
vim.keymap.set('i', 'uee', 'ü')
vim.keymap.set('i', 'Aee', 'Ä')
vim.keymap.set('i', 'Oee', 'Ö')
vim.keymap.set('i', 'Uee', 'Ü')
vim.keymap.set('i', 'sss', 'ß')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
