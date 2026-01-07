return {
  "stevearc/oil.nvim",
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    {
      "-",
      function()
        return require("oil").open()
      end,
      mode = "n",
      desc = "Open Parent Directory with Oil",
    },
  },
}
