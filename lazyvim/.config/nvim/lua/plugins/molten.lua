return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  build = ":UpdateRemotePlugins",
  init = function()
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_max_height = 20

    -- Notebooks
    vim.g.molten_auto_open_output = false
    vim.g.molten_wrap_output = true
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_lines_off_by_1 = true
  end,

  keys = {
    {
      "<localleader>mi",
      ":MoltenInit<CR>",
      silent = true,
      desc = "Initialize Molten",
    },
    {
      "<localleader>e",
      ":MoltenEvaluateOperator<CR>",
      silent = true,
      desc = "Molten run operator selection",
    },
    {
      "<localleader>rl",
      ":MoltenEvaluateLine<CR>",
      silent = true,
      desc = "Molten evaluate line",
    },
    {
      "<localleader>rr",
      ":MoltenReevaluateCell<CR>",
      silent = true,
      desc = "Molten re-evaluate cell",
    },
    {
      "<localleader>r",
      ":<C-u>MoltenEvaluateVisual<CR>gv",
      silent = true,
      desc = "Molten evaluate visual selection",
      mode = "v",
    },
    { "<localleader>oh", "<cmd>MoltenHideOutput<cr>", desc = "close output window", silent = true },
    { "<localleader>md", "<cmd>MoltenDelete<cr>", desc = "delete Molten cell", silent = true },
  },

  dependencies = {
    {
      "3rd/image.nvim",
      -- image nvim options table. Pass to `require('image').setup`
      opts = {
        backend = "kitty", -- Kitty will provide the best experience, but you need a compatible terminal
        integrations = {}, -- do whatever you want with image.nvim's integrations
        max_width = 100, -- tweak to preference
        max_height = 12, -- ^
        max_height_window_percentage = math.huge, -- this is necessary for a good experience
        max_width_window_percentage = math.huge,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      },
    },
    {
      "quarto-dev/quarto-nvim",
      opts = {
        lspFeatures = {
          languages = { "r", "python", "rust" },
          chunks = "all",
          diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
          },
          completion = {
            enabled = true,
          },
        },
        keymap = {
          hover = "H",
          definition = "gd",
          rename = "<leader>cr",
          references = "gr",
          format = "<leader>cf",
        },
        codeRunner = {
          enabled = true,
          default_method = "molten",
        },
      },
      ft = { "quarto", "markdown" },
      keys = {
        {
          "<localleader>rc",
          function()
            require("quarto.runner").run_cell()
          end,
          desc = "run cell",
          mode = "n",
        },
        {
          "<localleader>ra",
          function()
            require("quarto.runner").run_above()
          end,
          desc = "run cell and above",
          mode = "n",
        },
        {
          "<localleader>rA",
          function()
            require("quarto.runner").run_all()
          end,
          desc = "run all cells",
          mode = "n",
        },
        {
          "<localleader>rl",
          function()
            require("quarto.runner").run_line()
          end,
          desc = "run line",
          mode = "n",
        },
        {
          "<localleader>r",
          function()
            require("quarto.runner").run_range()
          end,
          desc = "run visual range",
          mode = "v",
        },
        {
          "<localleader>RA",
          function()
            require("quarto.runner").run_all(true)
          end,
          desc = "run all cells of all languages",
          mode = "n",
        },
      },
    },
    {
      "gcballesteros/jupytext.nvim",
      opts = {
        style = "markdown",
        output_extension = "md",
        force_ft = "markdown",
      },
      lazy = false,
    },
    "jmbuhr/otter.nvim",
  },
}
