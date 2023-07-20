local function on_attach(_, bufnr)
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('<leader>fm', vim.lsp.buf.format, '[F]or[m]at current buffer')
    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame symbol')
    nmap('K', vim.lsp.buf.hover, 'Hover documentation')
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('gT', vim.lsp.buf.type_definition, '[G]oto [T]ype definition')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local function init()
    local settings = require('tobb10001.lsp_settings')
    require('mason-lspconfig').setup_handlers({
        function(server_name)
            require('lspconfig')[server_name].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = settings[server_name] and settings[server_name].settings or {},
                root_dir = settings.root_dir
            })
        end
    })
end

return {
    {
        'neovim/nvim-lspconfig',
        init = init,
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
            {
                'folke/neodev.nvim',
                config = true,
            }
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
