return {
    {
        'neovim/nvim-lspconfig',
        init = require('tobb10001.lsp').init_lspconfig,
        dependencies = {
            {
                'williamboman/mason.nvim',
                build = ":MasonUpdate",
                config = true,
            },
            {
                'williamboman/mason-lspconfig.nvim',
                config = true,
            },
        },
    },
    {
        'jay-babu/mason-null-ls.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'williamboman/mason.nvim',
            {
                'jose-elias-alvarez/null-ls.nvim',
                dependencies = { 'nvim-lua/plenary.nvim' },
            },
        },
        init = function()
            require('mason-null-ls').setup({
                automatic_installation = false,
                handlers = {},
            })
            require('null-ls').setup({
                sources = {}
            })
        end
    },
}
