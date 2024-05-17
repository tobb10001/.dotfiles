return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			current_line_blame_opts = {
				virt_text = true,
			},
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
				map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "[U]ndo stage [H]unk" })
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "GitSigns: [S]tage [H]unk" })
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "GitSigns: [S]tage [R]eset" })
				map("n", "<leader>hS", gs.stage_buffer, { desc = "[S]tage buffer" })
				map("n", "<leader>hR", gs.reset_buffer, { desc = "[R]eset buffer" })
				map("n", "<leader>hd", gs.diffthis, { desc = "[D]iff the current file against the index" })
				map("n", "<leader>hD", function() gs.diffthis('~') end, { desc = "[D]iff the current file against HEAD" })
				map("n", "<leader>ho", gs.toggle_deleted, { desc = "Toggle showing [O]ld (deleted) lines" })
				map("n", "<leader>hb", function() gs.blame_line({ full = true }) end,
					{ desc = "[B]lame for current line" })
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
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		keys = {
			{
				"<leader>dv",
				function()
					vim.cmd(":DiffviewOpen")
				end,
				{ desc = "Open [D]iff[V]iew" },
			},
			{
				"<leader>dc",
				function()
					vim.cmd(":DiffviewClose")
				end,
				{ desc = "[C]lose [D]iffView" },
			},
		},
	},
}
