return {
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
		opts = {
			transparent = true,
			on_highlights = function(hl, c)
				hl.LineNr = {
					fg = "#ffffff",
				}
				hl.LineNrAbove = {
					fg = "#cccccc",
				}
				hl.LineNrBelow = {
					fg = "#cccccc",
				}
				hl.Comment = {
					fg = "#aaaaaa",
				}
				hl.DiagnosticUnnecessary = {
					fg = "#777777",
				}
			end,
		},
		init = function()
			vim.cmd(":colorscheme tokyonight")
		end,
		cond = not vim.g.vscode,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
		event = { "BufReadPost", "BufNewFile" },
		cond = not vim.g.vscode,
	},
	-- {
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	main = "ibl",
	-- 	opts = {},
	-- 	event = "VeryLazy",
	-- 	cond = not vim.g.vscode,
	-- },
	{
		"shellRaining/hlchunk.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("hlchunk").setup({
				chunk = { enable = true, use_treesitter = true },
				indent = {
					enable = true,
					chars = {
						"│",
					},
					style = {
						"#FF0000",
						"#FF7F00",
						"#FFFF00",
						"#00FF00",
						"#00FFFF",
						-- "#0000FF",  # too dark on my background
						"#8B00FF",
					},
				},
				line_num = { enable = true }, -- FIXME: Colors...
				blank = { enable = true },
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				theme = "tokyonight",
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
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
						end
					}
				},
				lualine_c = { { "filename", path = 1 } },
				lualine_y = { "tabs" },
				lualine_z = { "progress", "location" },
			},
		},
		event = "VeryLazy",
		cond = not vim.g.vscode,
	},
	{
		"mawkler/modicator.nvim",
		opts = {},
		event = { "BufReadPost", "BufNewFile" },
		cond = not vim.g.vscode,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "tabs",
				},
			})
		end,
		event = { "VeryLazy" },
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
		event = "VeryLazy"
	}
}
