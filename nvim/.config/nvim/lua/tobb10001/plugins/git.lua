return {
	{
		"lewis6991/gitsigns.nvim",
		config = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local map = function(mode, keys, func, opts)
					opts = opts or {}
					opts.buffer = bufnr
					if opts.desc then
						opts.desc = "GitSigns: " .. opts.desc
					end
					vim.keymap.set(mode, keys, func, opts)
				end
				map("n", "<leader>hs", gs.stage_hunk, { desc = "[S]tage [H]unk" })
				map("n", "<leader>hr", gs.reset_hunk, { desc = "[S]tage [R]eset" })
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "GitSigns: [S]tage [H]unk" })
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "GitSigns: [S]tage [R]eset" })
				map("n", "]h", function()
					if vim.wo.diff then
						return "]h"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Next [H]unk" })

				map("n", "[h", function()
					if vim.wo.diff then
						return "[h"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, desc = "Previous [H]unk" })
			end,
		},
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
	},
	{
		"linrongbin16/gitlinker.nvim",
		config = function()
			require("gitlinker").setup({
				router = {
					-- false positives are never a problem here...
					browse = {
						["^gitlab.*"] = require("gitlinker.routers").gitlab_browse,
					},
					blame = {
						["^gitlab.*"] = require("gitlinker.routers").gitlab_blame,
					},
				},
			})
		end,
		event = { "BufReadPost", "BufNewFile" },
	},
	-- {
	--     'harrisoncramer/gitlab.nvim',
	--     dependencies = {
	--         "MunifTanjim/nui.nvim",
	--         "nvim-lua/plenary.nvim",
	--         "sindrets/diffview.nvim",
	--         "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
	--         "nvim-tree/nvim-web-devicons" -- Recommended but not required. Icons in discussion tree.
	--     },
	--     build = function () require("gitlab.server").build(true) end,
	--     config = function() require("gitlab").setup() end,
	-- },
}
