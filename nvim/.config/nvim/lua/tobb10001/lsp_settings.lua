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
				},
			},
			language = "en-GB",
			latex = {
				commands = {
					["\\texttt{}"] = "ignore",
					["\\includesvg{}"] = "ignore",
				},
			},
		},
	},
}
