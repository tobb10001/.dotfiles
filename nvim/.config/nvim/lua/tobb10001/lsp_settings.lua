return {
	ltex = {
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
}
