local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local function init()
    local lspconfig = require('lspconfig')

    lspconfig.ansiblels.setup({})
    lspconfig.gopls.setup({})
    lspconfig.lua_ls.setup({})
    lspconfig.pyright.setup({})
    lspconfig.r_language_server.setup({})
    lspconfig.tsserver.setup({})

    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = desc })
            end
            nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            nmap('<leader>f', vim.lsp.buf.format, '[F]ormat current buffer')
            nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame symbol')
            nmap('K', vim.lsp.buf.hover, 'Hover documentation')
            nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature help')
            nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            nmap('gS', vim.lsp.buf.type_definition, '[G]oto Type definition')
            nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        end
    })
end

return {
    {
        'neovim/nvim-lspconfig',
        init = init,
        dependencies = {
            {
                'folke/neodev.nvim',
                config = true,
            }
        },
    },
}
