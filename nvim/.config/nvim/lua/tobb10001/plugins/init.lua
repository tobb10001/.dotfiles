-- Some miscellaneous plugins, most of them are distributed in adjacent files.

return {
  -- NOTE: First, some plugins that don't require any configuration

  {
    'folke/which-key.nvim',
    opts = {
      triggers_blacklist = {
        i = { "a", "o", "u", "s", "z", "A", "O", "U" },
      }
    }
  },
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
  },
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy = false,
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    setup = true,
  },
  {
    'rest-nvim/rest.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      skip_ssl_verification = true,
      encode_url = false,
    }
  },
  'tpope/vim-sleuth',
}
