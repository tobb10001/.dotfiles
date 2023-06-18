return {
	{
        'stevearc/oil.nvim',
        config = true,
        keys = {
            {
                "-",
                function ()
                    return require("oil").open()
                end,
                mode = 'n',
                desc = 'Open parent directory',
            },
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
	}
}
