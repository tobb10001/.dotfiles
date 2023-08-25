return {
    {
        'stevearc/oil.nvim',
        opts = {
            view_options = {
                show_hidden = true,
            },
        },
        keys = {
            {
                "-",
                function()
                    return require("oil").open()
                end,
                mode = 'n',
                desc = 'Open parent directory',
            },
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    }
}
