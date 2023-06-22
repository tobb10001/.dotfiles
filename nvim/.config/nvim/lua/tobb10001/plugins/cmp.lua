local function init()
    vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-u>'] = cmp.mapping.scroll_docs(4),
            -- ['<space><space>'] = cmp.mapping.complete({}),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = false,
            }),
            ['<C-j>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<C-k>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<C-h>'] = cmp.mapping(function(fallback)
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<C-l>'] = cmp.mapping(function(fallback)
                if luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
        }),
        sources = require('cmp').config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
        },
        {
            { name = 'path' },
            { name = 'buffer' },
        }),
    })
end

return {
    {
        'hrsh7th/nvim-cmp',
        init = init,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            {
                'L3MON4D3/LuaSnip',
                version = '1.*',
                build = 'make install_jsregexp',
            },
            'saadparwaiz1/cmp_luasnip',
        }
    },
}
