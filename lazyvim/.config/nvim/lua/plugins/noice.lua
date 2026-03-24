return {
  "folke/noice.nvim",
  opts = function(_, opts)
    opts.lsp.progress = {
      enabled = false,
    }
  end,
}
