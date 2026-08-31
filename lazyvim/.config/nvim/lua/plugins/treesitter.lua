return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  opts = function(_, opts)
    -- vim.tbl_extend("error", opts.move.keys.goto_next_start, {
    --   ["]b"] = { query = "@code_cell.inner", desc = "next code block" },
    -- })
    -- vim.tbl_extend("error", opts.move.keys.goto_previous_start, {
    --   ["[b"] = { query = "@code_cell.inner", desc = "prev code block" },
    -- })
  end,
}
