return {
	{
		"Yohannfra/Vim-Goto-Header",
		ft = { "c", "cpp" },
		keys = {
			{
				"gh",
				function() vim.cmd(":GotoHeaderSwitch") end,
				mode = "n",
				ft = { "c", "cpp" },
				desc = "Switch between header and source file.",
			},
			{
				"gH",
				function() vim.cmd(":GotoHeader") end,
				mode = "n",
				ft = { "c", "cpp" },
				desc = "Go to Header file under cursor.",
			},
		}
	}
}
