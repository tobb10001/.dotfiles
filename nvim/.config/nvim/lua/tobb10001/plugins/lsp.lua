local function config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	local lspconfig = require("lspconfig")

	local general_options = { capabilities = capabilities }

	local mkoptions = function(specific_options)
		local result = {}
		for k, v in pairs(general_options) do
			result[k] = v
		end
		for k, v in pairs(specific_options) do
			result[k] = v
		end
		return result
	end

	lspconfig.ansiblels.setup(general_options)
	lspconfig.bashls.setup(general_options)
	lspconfig.dockerls.setup(general_options)
	lspconfig.gopls.setup(general_options)
	lspconfig.ltex.setup(general_options)
	lspconfig.lua_ls.setup(general_options)
	lspconfig.pyright.setup(general_options)
	lspconfig.r_language_server.setup(general_options)
	lspconfig.tsserver.setup(general_options)
	lspconfig.yamlls.setup(mkoptions({
		filetypes = { "yaml", "yaml.gitlab-ci", "yaml.dockerfile" },
		yaml = {
			schemaStore = {
				enable = true,
			},
			schemas = {
				["http://gitlab.com/gitlab-org/gitlab/-/blob/master/app/assets/javascripts/editor/schema/ci.json"] = "/**/.gitlab-ci.yml",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/**/docker-compose.ya?ml",
			},
		},
	}))

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
			end
			local client = vim.lsp.get_client_by_id(ev.data.client_id)

			nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			if client.supports_method("textDocument/formatting") then
				nmap("<leader>f", vim.lsp.buf.format, "[F]ormat current buffer with LSP")
			end
			nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame symbol")
			nmap("K", vim.lsp.buf.hover, "Hover documentation")
			nmap("<C-k>", vim.lsp.buf.signature_help, "Signature help")
			nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
			nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
			nmap("gS", vim.lsp.buf.type_definition, "[G]oto Type definition")
			nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
		end,
	})
end

return {
	{
		"neovim/nvim-lspconfig",
		config = config,
		dependencies = {
			{
				"folke/neodev.nvim",
				opts = {},
			},
			{
				"SmiteshP/nvim-navbuddy",
				dependencies = {
					"SmiteshP/nvim-navic",
					"MunifTanjim/nui.nvim",
				},
				opts = { lsp = { auto_attach = true } },
			},
			{
				"simrat39/symbols-outline.nvim",
				config = true,
				event = { "BufReadPost", "BufNewFile" },
			},
			"onsails/lspkind.nvim",
			"VidocqH/lsp-lens.nvim",
			{
				"klen/nvim-config-local",
				lazy = false,
				config = function()
					require("config-local").setup({
						config_files = { ".nvim.lua" },
						commands_create = true,
					})
				end,
			},
		},
		event = { "BufReadPost", "BufNewFile" },
	},
}
