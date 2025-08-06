return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"allaman/emoji.nvim",
		"saghen/blink.compat",
	},

	version = "*",
	event = { "BufReadPost", "BufNewFile", "CmdlineEnter" },

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {

			preset = "none", -- disable all keymaps, that we didn't create

			["<C-Space>"] = { "show", "hide" }, -- toggle
			["<CR>"] = { "accept", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-h>"] = { "snippet_backward" },
			["<C-l>"] = { "snippet_forward" },
		},

		completion = {
			list = {
				selection = {
					preselect = false,
				},
			},
			menu = {
				draw = {
					columns = {
						{ "kind_icon", "label", gap = 1 },
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 150,
			},
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer", "emoji" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
				emoji = {
					name = "emoji",
					module = "blink.compat.source",
					transform_items = function(ctx, items)
						local kind = require("blink.cmp.types").CompletionItemKind.Text
						for i = 1, #items do
							items[i].kind = kind
						end
						return items
					end,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
