return {
	"rest-nvim/rest.nvim",
	version = "1.*",
	ft = "http",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("rest-nvim").setup({
			encode_url = false,
		})
	end,
	opts = {
		encode_url = false,
	},
	keys = {
		{
			"<leader>rr",
			function()
				return require("rest-nvim").run()
			end,
			mode = "n",
			desc = "[R]est: [R]un the request under the cursor.",
		},
		{
			"<leader>rp",
			function()
				return require("rest-nvim").run(true)
			end,
			mode = "n",
			desc = "[R]est: [P]review the request under the cursor.",
		},
		{
			"<leader>rl",
			function()
				return require("rest-nvim").last
			end,
			mode = "n",
			desc = "[R]est: Re-run the [l]ast Request.",
		},
	},
}
