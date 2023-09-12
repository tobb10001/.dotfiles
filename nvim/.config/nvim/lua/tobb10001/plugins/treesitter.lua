return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        build = ':TSUpdate',
        init = function()
            require("nvim-treesitter.configs").setup({
                highlight = {
                    enable = true,
                    disable = {},
                },
            })
        end,
    },
    {
        'nvim-treesitter/playground',
        build = ':TSInstall query',
    },
}
