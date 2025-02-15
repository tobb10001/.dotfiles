return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		event = { "BufReadPost", "BufNewFile" },
		config = function(_, opts)
			if opts then
				require("luasnip").config.setup(opts)
			end
			for _, type in ipairs({ "vscode", "snipmate", "lua" }) do
				require("luasnip.loaders.from_" .. type).lazy_load()
			end
			local comments = {
				javascript = { "jsdoc" },
				lua = { "luadoc" },
				pytnon = { "pydoc" },
				rust = { "rustdoc" },
				sh = { "shelldoc" },
				typescript = { "tsdoc" },
			}
			for ft, subject in pairs(comments) do
				require("luasnip").filetype_extend(ft, subject)
			end
			require("tobb10001.snippets")
		end,
	},
}
