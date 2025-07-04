local M = {}

local function server_setup()
	local lspconfig = require("lspconfig")
	-- Ansible
	vim.lsp.enable("ansiblels")
	-- Bash
	vim.lsp.enable("bashls")
	-- C
	vim.lsp.enable("clangd")
	-- Docker
	-- vim.lsp.enable("dockerls")
	-- GitHub Actions
	vim.lsp.enable("gh_actions_ls")
	-- Go
	vim.lsp.enable("gopls")
	-- HTMX
	-- vim.lsp.enable("htmx")
	-- JSON
	vim.lsp.enable("jsonls")
	-- LaTeX, Markdown, ...
	-- lspconfig.ltex.setup({
	-- 	autostart = false,
	-- })
	vim.lsp.enable("ltex_plus")
	vim.lsp.enable("texlab")
	-- Lua
	vim.lsp.config("lua_ls", {
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if
					path ~= vim.env.HOME .. "/.dotfiles"
					and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
				then
					return
				end
			end
			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					version = "LuaJIT",
					path = { "lua/?.lua", "lua/?/init.lua" },
				},
				workspace = {
					checkThirdParty = false,
					library = { vim.env.VIMRUNTIME },
				},
			})
		end,
		settings = { Lua = {} },
	})
	vim.lsp.enable("lua_ls")
	-- Nix
	vim.lsp.enable("nil_ls")
	vim.lsp.enable("nixd")
	-- Python
	vim.lsp.enable("basedpyright")
	-- vim.lsp.enable("pylsp")
	-- vim.lsp.enable("pyright")
	vim.lsp.enable("ruff")
	-- R
	vim.lsp.enable("r_language_server")
	-- Rust
	vim.lsp.config("rust_analyzer", {
		settings = {
			["rust-analyzer"] = {
				cargo = {
					features = "all",
				},
			},
		},
	})
	vim.lsp.enable("rust_analyzer")
	-- Terraform
	vim.lsp.enable("terraformls")
	-- TOML
	vim.lsp.enable("taplo")
	-- TypeScript, JavaScript
	-- Handled by typescript-tools
	-- vim.lsp.enable("tsserver")
	-- Vue
	vim.lsp.enable("vue_ls")
	-- Web
	vim.lsp.enable("emmet_ls")
	-- Yaml
	vim.lsp.config("yamlls", {
		filetypes = { "yaml", "yaml.gitlab-ci", "yaml.dockerfile", "yaml.github" },
		settings = {
			yaml = {
				schemas = {
					["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json"] = "/**/.appstore/deployment.yml",
				},
			},
		},
	})
	vim.lsp.enable("yamlls")
end

function M.capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	return capabilities
end

function M.on_attach(client, bufnr)
	-- require("workspace-diagnosics").populate_workspace_diagnostics(client, bufnr)
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
	vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, { buffer = client.buf, desc = "[S]ignature help" })

	if client.resolved_capabilities and client.resolved_capabilities.highlight_provider() then
		vim.cmd(":TSBufDisable highlight")
	end

	vim.lsp.inlay_hint.enable()

	if client.name == "ltex" or client.name == "ltex_plus" then
		require("ltex_extra").setup({})
	end
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
