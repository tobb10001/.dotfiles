return {
    -- Colorscheme
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = {},
        init = function()
            vim.cmd(':colorscheme tokyonight')
        end,
    },
    -- Fidget for LSP Progress
    {
        'j-huy/fidget.nvim',
        opts = {
            text = {
                spinner = "moon", -- animation shown when tasks are ongoing
            },
            fmt = {
                leftpad = false, -- right-justify text in fidget box
            },
        },
    },
    -- Gitsigns
    {
        'lewis6991/gitsigns.nvim',
        config = true,
    },
}
