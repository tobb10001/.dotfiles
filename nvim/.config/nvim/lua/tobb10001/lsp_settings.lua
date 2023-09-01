local lspconfig = require("lspconfig")

return {
	ltex = {
		settings = {
			ltex = {
				additionalRules = {
					enablePickyRules = true,
				},
				completionEnabled = true,
				dictionary = {
					["en-GB"] = {
						"Neovim",
						"delighters",
						"dissatisfiers",
					},
				},
				disabledRules = {
					["en-GB"] = {
						"ARROWS",
						"DASH_RULE",
						"ELLIPSIS",
						"UNIT_SPACE",
					},
				},
				language = "en-GB",
				latex = {
					commands = {
						["\\code{}"] = "dummy",
						["\\crefrange{}{}"] = "dummy",
						["\\includesvg{}"] = "ignore",
					},
				},
			},
		},
	},
	pylsp = {
		settings = {
			pylsp = {
				plugins = {
					flake8 = {
						ignore = {
							"E501",
							"W503",
						},
					},
					pycodestyle = {
						ignore = {
							"E501",
							"W503",
						},
					}
				},
			},
		},
	},
	lua_ls = {
		root_dir = function(fname)
			return lspconfig.util.root_pattern('lua')(fname)
		end
	},
}
