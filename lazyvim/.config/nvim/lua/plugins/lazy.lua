return {
  "folke/lazy.nvim",
  opts = function(_, opts)
    opts.checker.enabled = false
    opts.dev.path = "~/git/oss"
  end,
}
