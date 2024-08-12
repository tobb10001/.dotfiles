return {
	"mbbill/undotree",
	event = "VeryLazy",
	keys = {
		-- { "<leader>ft", "<cmd>Undotree toggle<CR>", desc = "Toggle [U]ndotree" },
	},
	cond = not vim.g.vscode,
}
