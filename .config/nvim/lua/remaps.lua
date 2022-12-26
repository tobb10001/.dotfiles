function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true })
end

function imap (shortcut, command)
    map('i', shortcut, command)
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

nmap("<Leader>rg", ":Rg<CR>")
nmap("<Leader>gf", ":GFiles<CR>")
nmap("<Leader>af", ":Files<CR>")
nmap("<Leader>so", ":source " .. CONFIG .. "/init.lua<CR>")

imap("oee", "ö")
imap("uee", "ü")
imap("aee", "ä")
imap("sss", "ß")
imap("Oee", "Ö")
imap("Uee", "Ü")
imap("Aee", "Ä")
imap("kj", "<Esc>")

map("t", "<Esc>", "<C-\\><C-n>")
