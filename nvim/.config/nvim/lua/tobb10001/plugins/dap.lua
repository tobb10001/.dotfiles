return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				dependencies = { "nvim-neotest/nvim-nio" },
			},
			{
				"leoluz/nvim-dap-go",
				config = true,
			},
		},
		keys = {
			{
				"<leader>ds",
				function()
					require("dap").continue()
				end,
				desc = "[D]ebug: [S]tart/Continue",
			},
			{
				"<leader>dc",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "[D]ebug: Run to [C]ursor",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "[D]ebug: [S]tep Into",
			},
			{
				"<leader>dj",
				function()
					require("dap").step_over()
				end,
				desc = "[D]ebug: [S]tep Over",
			},
			{
				"<leader>do",
				function()
					require("dap").step_out()
				end,
				desc = "[D]ebug: [S]tep Out",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "[D]ebug: Toggle [B]reakpoint",
			},
			{
				"<leader>dB",
				function()
					requre("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "[D]ebug: Set [B]reakpoint",
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Dap UI setup
			-- For more information, see |:help nvim-dap-ui|
			dapui.setup({
				-- Set icons to characters that are more likely to work in every terminal.
				--    Feel free to remove or use ones that you like more! :)
				--    Don't feel like these are good choices.
				icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
				controls = {
					icons = {
						pause = "⏸",
						play = "▶",
						step_into = "⏎",
						step_over = "⏭",
						step_out = "⏮",
						step_back = "b",
						run_last = "▶▶",
						terminate = "⏹",
						disconnect = "⏏",
					},
				},
			})

			-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
			vim.keymap.set("n", "<leader>dt", dapui.toggle, { desc = "Debug: See last session result." })

			dap.listeners.after.event_initialized["dapui_config"] = dapui.open
			dap.listeners.before.event_terminated["dapui_config"] = dapui.close
			dap.listeners.before.event_exited["dapui_config"] = dapui.close

			-- Initialize adapters
			require("dap-python").setup("~/.local/share/nvim/debugpy_venv/bin/python")
			dap.configurations.python[3].justMyCode = false -- FIXME: Find a better way to handle this stuff.
		end,
		cond = not vim.g.vscode,
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap" },
		ft = { "python" },
		cond = not vim.g.vscode,
	},
}
