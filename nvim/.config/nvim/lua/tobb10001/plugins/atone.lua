return {
	"XXiaoA/atone.nvim",
	cmd = "Atone",
	opts = {},
	keys = {
		{
			"<leader>u",
			function()
				vim.cmd(":Atone toggle")
			end,
			desc = "Toggle [u]ndotree",
			silent = true,
		},
	},
}
