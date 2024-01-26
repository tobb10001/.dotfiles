return {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    opts = {
        load = {
            ["core.completion"] = {
                config = {
                    engine = "nvim-cmp",
                },
            },
            ["core.concealer"] = {},
            ["core.defaults"] = {},
            ["core.dirman"] = {
                config  = {
                    workspaces = {
                        meetings = "~/notes/meetings"
                    },
                },
            },
            ["core.export"] = {},
            ["core.export.markdown"] = {},
        },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-neorg/neorg-telescope',
    },
    lazy = false,
}
