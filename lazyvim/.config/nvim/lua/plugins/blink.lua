return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    opts.completion.list = {
      selection = {
        preselect = false,
      },
    }
    opts.completion.menu.auto_show = false
    opts.signature = {
      enabled = false,
    }
    opts.sources.default = vim.tbl_filter(function(v)
      return v ~= "buffer"
    end, opts.sources.default)
  end,
}
