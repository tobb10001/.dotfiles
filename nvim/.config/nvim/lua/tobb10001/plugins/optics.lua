return {
	-- Colorscheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
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
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
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
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		keys = {
			{ "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "[D]ismiss [N]oice Message" } },
		},
	},
	-- Fidget for LSP Progress
	{
		"j-hui/fidget.nvim",
		opts = {
			progress = {
				display = {
					progress_icon = { pattern = "moon" },
				},
			},
		},
		enabled = false, -- noice does that...
	},
	-- Gitsigns
	{
		"lewis6991/gitsigns.nvim",
		config = true,
		event = { "BufReadPost", "BufNewFile" },
	},
	-- Transparent
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	-- Lualine
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
	},
	{
		"mawkler/modicator.nvim",
		opts = {},
		event = { "BufReadPost", "BufNewFile" },
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
	},
	{
		"stevearc/dressing.nvim",
		config = true,
	},
}
