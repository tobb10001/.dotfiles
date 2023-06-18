-- vim: ts=4 sts=4 sw=4 et

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Package Manager: folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup("tobb10001.plugins", {})

-- General configuration
require('tobb10001.options')
require('tobb10001.keymaps')

-- Miscellaneous stuff.
require('tobb10001.misc')

-- Plugin configuration.
