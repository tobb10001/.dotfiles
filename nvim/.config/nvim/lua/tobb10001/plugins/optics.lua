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
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				progress = { enabled = false },
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = true, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		keys = {
			{ "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "[D]ismiss [N]oice Message" } },
		},
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
				line_num = { enable = false }, -- FIXME: Colors...
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
				component_separators = "|",
				section_separators = "",
			},
			sections = {
				lualine_c = { { "filename", path = 1 } },
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
