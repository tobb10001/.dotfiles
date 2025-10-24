local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Configure Capabilities --
-- nvim ufo
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
vim.lsp.config("*", { capabilities = capabilities })

-- Configure Servers --
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
vim.lsp.config("ltex_plus", {
	filetypes = {
		"bib",
		"context",
		"gitcommit",
		"html",
		"markdown",
		"org",
		"pandoc",
		"plaintex",
		"quarto",
		"mail",
		"mdx",
		"rmd",
		"rnoweb",
		"rst",
		"tex",
		-- "text",
		"typst",
		"xhtml",
	},
})
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
-- vim.lsp.enable("ty")
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
-- Typst
vim.lsp.enable("tinymist")
vim.lsp.enable("vue_ls")
-- Web
vim.lsp.enable("emmet_ls")
-- Yaml
vim.lsp.config("yamlls", { filetypes = { "yaml", "yaml.gitlab-ci", "yaml.dockerfile", "yaml.github" } })
vim.lsp.enable("yamlls")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("tobb10001.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local bufnr = assert(args.buf)
		require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
		local nmap = function(keys, func, desc)
			if desc then
				desc = "LSP: " .. desc
			end

			vim.keymap.set("n", keys, func, { buffer = client.buf, desc = desc })
		end

		-- extending the :lsp-defaults
		-- gra is set in Normal mode by default, but not in visual mode?
		vim.keymap.set("v", "gra", vim.lsp.buf.code_action, { buffer = client.buf, desc = "Code [A]ction" })
		nmap("grd", vim.lsp.buf.definition, "[G]oto [D]efinition")
		nmap("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		nmap("grs", vim.lsp.buf.type_definition, "[G]oto Type definition")

		if client.resolved_capabilities and client.resolved_capabilities.highlight_provider() then
			vim.cmd(":TSBufDisable highlight")
		end

		vim.lsp.inlay_hint.enable()

		if client.name == "ltex" or client.name == "ltex_plus" then
			require("ltex_extra").setup({})
		end
	end,
})
