vim.opt.colorcolumn = ""
vim.opt.textwidth = 88

vim.keymap.set('n', '<leader>fp', function ()
    vim.cmd(":set formatexpr=")
    vim.fn.feedkeys('gqap')
end, { desc = "Reformat the current paragraph" })
