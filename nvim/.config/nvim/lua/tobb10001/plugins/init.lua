-- Some miscellaneous plugins, most of them are distributed in adjacent files.

return {
  {
    'dhruvmanila/browser-bookmarks.nvim',
    version = '*',
    opts = {
      selected_browser = 'firefox',
      url_open_command = 'xdg-open',
    },
    dependencies = {
      'kkharji/sqlite.lua',
    }
  },
  {
    'folke/which-key.nvim',
    opts = {
      triggers_blacklist = {
        i = { "a", "o", "u", "s", "z", "A", "O", "U" },
      }
    }
  },
  {
    'kkoomen/vim-doge',
    build = ':call doge#install()',
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  { 'numToStr/Comment.nvim', opts = {} },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('neo-tree').setup {}
    end,
  },
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    opts = {
      load = {
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.concealer"] = {},
        ["core.defaults"] = {},
        ["core.export"] = {},
        ["core.export.markdown"] = {},
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neorg/neorg-telescope',
    },
    lazy = false,
  },
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
