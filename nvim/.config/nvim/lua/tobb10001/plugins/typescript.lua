return {
	"pmizio/typescript-tools.nvim",
	ft = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"vue",
	},
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	opts = {
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
		-- root_dir = function(fname)
		-- 	local util = require("lspconfig.util")
		-- 	-- Find the nearest package.json (closest to the current file)
		-- 	local current_dir = vim.fn.fnamemodify(fname, ":p:h")
		--
		-- 	while current_dir ~= "/" do
		-- 		local package_json = current_dir .. "/package.json"
		-- 		if vim.fn.filereadable(package_json) == 1 then
		-- 			return current_dir
		-- 		end
		-- 		current_dir = vim.fn.fnamemodify(current_dir, ":h")
		-- 	end
		--
		-- 	-- Fallback to default behavior if nothing found
		-- 	return util.root_pattern("package.json", "tsconfig.json")(fname)
		-- end,
		settings = {
			-- tsserver_path = vim.env.HOME .. "/.cache/npm/global/lib/node_modules/typescript/lib/tsserver.js",
			tsserver = {
				exclude = { "node_modules", "dist", ".git" },
			},
			tsserver_file_preferences = {
				includeInlayParameterNameHints = "all",
			},
			tsserver_format_options = {
				indentSize = 2,
			},
			-- tsserver_plugins = {
			-- 	"@vue/typescript-plugin",
			-- },
			jsx_close_tag = { enable = true },
		},
	},
	cond = not vim.g.vscode,
}
