local M = {}

function on_attach(_, bufnr)
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
    nmap('gt', vim.lsp.buf.type_definition, '[G]oto [T]ype definition')
end

local settings = {
    
}

function M.init_lspconfig()
    require('mason-lspconfig').setup_handlers({
        function(server_name)
            require('lspconfig')[server_name].setup({
                on_attach = on_attach,
                setttings = settings[server_name],
            })
        end
    })
end

return M
