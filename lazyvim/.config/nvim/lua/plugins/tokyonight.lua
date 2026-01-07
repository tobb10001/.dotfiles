return {
  "folke/tokyonight.nvim",
  opts = {
    dim_inactive = true,
    transparent = true,
    on_highlights = function(hl, c)
      hl.Comment = {
        fg = "#AAAAAA",
      }
      hl.CopilotAnnotation = {
        fg = "#DDDDDD",
      }
      hl.CopilotSuggestion = {
        fg = "#CCCCCC",
      }
      hl.LineNr = {
        fg = "#FFFFFF",
      }
      hl.LineNrAbove = {
        fg = "#CCCCCC",
      }
      hl.LineNrBelow = {
        fg = "#CCCCCC",
      }
      hl.DiagnosticUnnecessary = {
        fg = "#777777",
      }
      hl.WinSeparator = {
        fg = "#777777",
      }
    end,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
