return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("harpoon"):setup()
	end,
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():append()
			end,
		},
		{
			"<C-e>",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
		},

		{
			"<C-h>",
			function()
				require("harpoon"):list():select(1)
			end,
		},
		{
			"<C-j>",
			function()
				require("harpoon"):list():select(2)
			end,
		},
		{
			"<C-k>",
			function()
				require("harpoon"):list():select(3)
			end,
		},
		{
			"<C-l>",
			function()
				require("harpoon"):list():select(4)
			end,
		},

		-- Toggle previous & next buffers stored within Harpoon list },
		{
			"<C-S-P>",
			function()
				require("harpoon"):list():prev()
			end,
		},
		{
			"<C-S-N>",
			function()
				require("harpoon"):list():next()
			end,
		},
	},
}
