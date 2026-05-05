return {
  {
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>",
        backwards_tabkey = "<S-Tab>",
        act_as_tab = true,
        act_as_shift_tab = true,
        default_tab = "<C-t>",
        default_shift_tab = "<C-d>",
        enable_backwards = true,
        completion = false,
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true,
        exclude = {},
      })
    end,
    dependencies = { -- These are optional
      "nvim-treesitter/nvim-treesitter",
    },
    opt = true, -- Set this to true if the plugin is optional
    event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },
}
