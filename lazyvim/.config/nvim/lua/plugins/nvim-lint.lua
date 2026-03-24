return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    opts.linters_by_ft.go = nil
    opts.linters_by_ft.markdown = nil
  end,
}
