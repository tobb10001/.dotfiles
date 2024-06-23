local M = {}

local function server_setup()
	local lspconfig = require("lspconfig")
	-- Ansible
	lspconfig.ansiblels.setup({})
	-- Bash
	lspconfig.bashls.setup({})
	-- C
	lspconfig.clangd.setup({})
	-- Docker
	-- lspconfig.dockerls.setup({})
	-- Go
	lspconfig.gopls.setup({})
	-- HTMX
	lspconfig.htmx.setup({})
	-- LaTeX, Markdown, ...
	lspconfig.ltex.setup({
		autostart = false,
	})
	-- Lua
	lspconfig.lua_ls.setup({})
	-- Nix
	lspconfig.nil_ls.setup({})
	lspconfig.nixd.setup({})
	-- Python
	-- lspconfig.basedpyright.setup({})
	-- lspconfig.pylsp.setup({})
	lspconfig.pyright.setup({})
	lspconfig.ruff.setup({})
	-- R
	lspconfig.r_language_server.setup({})
	-- Rust
	lspconfig.rust_analyzer.setup({
		settings = {
			["rust-analyzer"] = {
				cargo = {
					features = "all"
				}
			}
		}
	})
	-- Terraform
	lspconfig.terraformls.setup({})
	-- TypeScript, JavaScript
	-- Handled by typescript-tools
	-- lspconfig.tsserver.setup({})
	-- Yaml
	lspconfig.yamlls.setup({
		filetypes = { "yaml", "yaml.gitlab-ci", "yaml.dockerfile" },
		yaml = {
			schemaStore = {
				enable = true,
			},
			schemas = {
				["http://gitlab.com/gitlab-org/gitlab/-/blob/master/app/assets/javascripts/editor/schema/ci.json"] =
				"/**/.gitlab-ci.yml",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
				"/**/docker-compose.ya?ml",
			},
		},
	})
end

function M.capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}
end

function M.on_attach(client, _)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = client.buf, desc = desc })
	end

	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { buffer = client.buf, desc = "[C]ode [A]ction" })
	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame symbol")
	-- nmap("<C-k>", vim.lsp.buf.signature_help, "Signature help")
	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
	nmap("gs", vim.lsp.buf.type_definition, "[G]oto Type definition")

	if client.resolved_capabilities and client.resolved_capabilities.highlight_provider() then
		vim.cmd(":TSBufDisable highlight")
	end

	vim.lsp.inlay_hint.enable()
end

function M.lspconfig_config()
	local capabilities = M.capabilities()

	local lspconfig = require("lspconfig")

	lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
		capabilities = capabilities,
		on_attach = M.on_attach,
	})

	server_setup()
end

return M
