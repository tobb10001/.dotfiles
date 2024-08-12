local function config(opts)
	vim.opt.completeopt = { "menu", "menuone", "noselect" }

	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")

	cmp.setup({
		formatting = {
			expandable_indicator = true,
			format = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				ellipsis_char = "...",
				show_labelDetails = true,
			}),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-u>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete({}),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Insert,
				select = false,
			}),
			["<C-j>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-k>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-h>"] = cmp.mapping(function(fallback)
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-l>"] = cmp.mapping(function(fallback)
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-n>"] = cmp.mapping(function(fallback)
				if luasnip.choice_active() then
					luasnip.change_choice(1)
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-p>"] = cmp.mapping(function(fallback)
				if luasnip.choice_active() then
					luasnip.change_choice(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		preselect = cmp.PreselectMode.None,
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sorting = {
			comparators = {
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				require("cmp-under-comparator").under,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
		sources = require("cmp").config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "path" },
			{ name = "buffer" },
			{ name = "treesitter" },
			{ name = "dotenv" },
			{ name = "git" },
		}),
	})
	-- `/` cmdline setup.
	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})
	-- `:` cmdline setup.
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

return {
	{
		"hrsh7th/nvim-cmp",
		config = config,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
				dependencies = {
					"saadparwaiz1/cmp_luasnip",
					"rafamadriz/friendly-snippets",
				},
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
			{
				"lukas-reineke/cmp-under-comparator",
				version = "*",
			},
			"onsails/lspkind.nvim",
			{
				"petertriho/cmp-git",
				opts = {
					gitlab = {
						hosts = GitlabHost ~= nil and { GitlabHost } or {},
					},
				},
				dependencies = {
					"nvim-lua/plenary.nvim",
				},
			},
			"ray-x/cmp-treesitter",
			"saadparwaiz1/cmp_luasnip",
			"SergioRibera/cmp-dotenv",
		},
		event = { "BufReadPost", "BufNewFile" },
		cond = not vim.g.vscode,
	},
}
