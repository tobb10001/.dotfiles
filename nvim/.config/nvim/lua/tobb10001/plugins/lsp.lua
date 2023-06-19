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
            }
        },
    },
}
