return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true }, function(err)
					if not err then
						local mode = vim.api.nvim_get_mode().mode
						if vim.startswith(string.lower(mode), "v") then
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
						else
							require("conform").format({ async = true })
						end
					else
						vim.notify("Error when formatting: " .. vim.inspect(err), vim.log.levels.ERROR)
					end
				end)
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			markdown = { "prettier" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = function(bufnr)
			if vim.g.conform_disable or vim.b[bufnr].conform_disable then
				return
			end
			return {
				timeout_ms = 500,
			}
		end,
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		vim.api.nvim_create_user_command("ConformDisable", function()
			vim.g.conform_disable = true
		end, { desc = "Disable Conform" })
		vim.api.nvim_create_user_command("ConformEnable", function()
			vim.g.conform_disable = false
		end, { desc = "Enable Conform" })
		vim.api.nvim_create_user_command("ConformBufDisable", function()
			vim.b.conform_disable = true
		end, { desc = "Disable Conform for the current buffer" })
		vim.api.nvim_create_user_command("ConformBufEnable", function()
			vim.b.conform_disable = false
		end, { desc = "Enable Conform for the current buffer" })
	end,
	cond = not vim.g.vscode,
}
