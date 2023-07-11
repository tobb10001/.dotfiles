local lspconfig = require("lspconfig")

return {
	ltex = {
		settings = {
			ltex = {
				additionalRules = {
					enablePickyRules = true,
				},
				completionEnabled = true,
				disabledRules = {
					["en-GB"] = {
						"ELLIPSIS",
						"DASH_RULE",
					},
				},
				language = "en-GB",
				latex = {
					commands = {
						["\\code{}"] = "dummy",
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
						ignore = { "E501" },
					},
					pycodestyle = {
						ignore = { "E501" },
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
