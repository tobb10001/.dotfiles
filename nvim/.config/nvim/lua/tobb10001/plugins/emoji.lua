return {
	"allaman/emoji.nvim",
	version = "*",
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		enable_cmp_integration = true,
	},
	config = true,
}
