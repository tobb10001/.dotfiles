return {
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
		opts = {
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
			dim_inactive = true,
			lualine_bold = true,
		},
		init = function()
			vim.cmd(":colorscheme tokyonight-night")
		end,
		cond = not vim.g.vscode,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
		event = { "BufReadPost", "BufNewFile" },
		cond = not vim.g.vscode,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		event = "VeryLazy",
		cond = not vim.g.vscode,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_b = {
					{
						"branch",
						fmt = function(str)
							if str:len() > 20 then
								return str:sub(1, 20) .. "…"
							end
							return str
						end,
					},
				},
				lualine_c = { { "filename", path = 1 }, "diagnostics" },
				lualine_x = {
					{
						function()
							local prose = require("nvim-prose")
							if not prose.is_available() then
								return ""
							end
							local word_count = prose.word_count()
							if not word_count then
								return ""
							end
							return prose.word_count()
						end,
					},
					-- { require("nvim-prose").reading_time, cond = require("nvim-prose").is_available },
					{
						"diagnostics",
						sources = { "nvim_workspace_diagnostic" },
					},
					{
						"copilot",
						show_colors = true,
						show_loading = true,
					},
					"encoding",
					"fileformat",
					"filetype",
				},

				lualine_y = { "tabs" },
				lualine_z = {
					"progress",
					{
						"location",
						fmt = function(str)
							-- Is this cheating?
							return str .. "(" .. vim.api.nvim_get_current_buf() .. ")"
						end,
					},
				},
			},
		},
		event = "VeryLazy",
		cond = not vim.g.vscode,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
		version = "*",
		event = "VeryLazy",
		cond = not vim.g.vscode,
	},
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
	},
	-- Fidget for LSP Progress
	{
		"j-hui/fidget.nvim",
		event = "VeryLazy",
		opts = {
			progress = {
				display = {
					progress_icon = { pattern = "moon" },
				},
			},
		},
	},
	"ntpeters/vim-better-whitespace",
	{
		"norcalli/nvim-colorizer.lua",
		setup = function()
			require("colorizer").setup()
		end,
	},
}
