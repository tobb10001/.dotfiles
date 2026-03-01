return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          Comment = {
            fg = "#AAAAAA",
          },
          ColorColumn = {
            bg = "#555555",
          },
          CopilotAnnotation = {
            fg = "#DDDDDD",
          },
          CopilotSuggestion = {
            fg = "#CCCCCC",
          },
          LineNr = {
            fg = "#FFFFFF",
          },
          LineNrAbove = {
            fg = "#CCCCCC",
          },
          LineNrBelow = {
            fg = "#CCCCCC",
          },
          DiagnosticUnnecessary = {
            fg = "#777777",
          },
          WinSeparator = {
            fg = "#777777",
          },
        }
      end,
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      dim_inactive = true,
      transparent = true,
      on_highlights = function(hl, c)
        hl.Comment = {
          fg = "#AAAAAA",
        }
        hl.ColorColumn = {
          bg = "#555555",
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
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
