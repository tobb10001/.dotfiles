-- Useful variables

HOME = os.getenv("HOME")
CONFIG = HOME .. "/.config/nvim"

-- Attributes

vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.shiftwidth = 4
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.swapfile = false
vim.opt.syntax = "on"
vim.opt.tabstop = 4
vim.opt.undodir = HOME .. "/.local/share/nvim/undodir"
vim.opt.undofile = true
vim.opt.wrap = false

vim.cmd('let mapleader = " "')

-- Line Numbers
vim.cmd([[
" Numbers. https://jeffkreeftmeijer.com/vim-number/
set nu

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END
]])

-- Plugins
vim.cmd("source " .. CONFIG .. "/vim/plugins.vim")
vim.cmd("source " .. CONFIG .. "/vim/coc.vim")

-- Optics
require("optics")

-- Remaps
require("remaps")

-- End of init.vim
require'nvim-treesitter.configs'.setup{highlight={enable=true}}
