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
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        init = function()
            null_ls = require('null-ls')
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                },
            })
        end
    },
}
