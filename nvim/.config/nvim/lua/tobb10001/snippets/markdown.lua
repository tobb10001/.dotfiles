require("luasnip.session.snippet_collection").clear_snippets("markdown")

local ls = require("luasnip")

local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local s = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local i = ls.insert_node
local sn = ls.snippet_node
local t = ls.text_node

-- VitePress --------------------------------------------------------------------------

for _, type in ipairs({ "info", "tip", "warning", "danger", "details" }) do
	ls.add_snippets("markdown", {
		s(
			"vp" .. type,
			fmta([[
::: ]] .. type .. [[

	<body>
:::
]], {
				body = i(1),
			})
		),
	})
end
