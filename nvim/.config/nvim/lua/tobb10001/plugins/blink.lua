return {
	"saghen/blink.cmp",

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
				auto_show_delay_ms = 500,
			},
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
