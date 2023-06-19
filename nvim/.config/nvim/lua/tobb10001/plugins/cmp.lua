return {
    {
        'hrsh7th/nvim-cmp',
        init = require('tobb10001.cmp').init,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
        }
    },
}
