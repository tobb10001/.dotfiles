-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Center after jumping
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Type german letters
vim.keymap.set('i', 'aee', 'ä')
vim.keymap.set('i', 'oee', 'o')
vim.keymap.set('i', 'uee', 'ü')
vim.keymap.set('i', 'Aee', 'Ä')
vim.keymap.set('i', 'Oee', 'Ö')
vim.keymap.set('i', 'Uee', 'Ü')
vim.keymap.set('i', 'sss', 'ß')
