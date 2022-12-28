-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.api.nvim_create_autocmd(
  {"BufEnter", "FocusGained", "InsertLeave", "WinEnter"},
  {
    callback = function ()
      if vim.wo.number and vim.fn.mode() ~= 'i' then
        vim.wo.relativenumber = true
      end
    end
  }
)
vim.api.nvim_create_autocmd(
  {"BufLeave", "FocusLost", "InsertEnter", "WinLeave"},
  {
    callback = function ()
      if vim.wo.number then
        vim.wo.relativenumber = false
      end
    end
  }
)

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme onedark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
