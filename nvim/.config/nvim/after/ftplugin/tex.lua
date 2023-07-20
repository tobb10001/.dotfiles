vim.opt.colorcolumn = ""
vim.opt.textwidth = 88

vim.cmd(":set foldmethod=expr")
vim.cmd(":set foldexpr=nvim_treesitter#foldexpr()")

vim.keymap.set('n', '<leader>fp', function ()
    vim.cmd(":set formatexpr=")
    vim.fn.feedkeys('gqap')
end, { desc = "Reformat the current paragraph" })
