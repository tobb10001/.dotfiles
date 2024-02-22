require("luasnip.session.snippet_collection").clear_snippets("python")

local ls = require("luasnip")

local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local s = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local i = ls.insert_node
local sn = ls.snippet_node
local t = ls.text_node

ls.add_snippets("python", {
	s(
		"ifmain",
		fmta(
			[[
if __name__ == "__main__":
	<body>
]],
			{
				body = c(1, { t("raise SystemExit(main())"), i(1) }),
			}
		)
	),
})
