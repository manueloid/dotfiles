local ls           = require('luasnip')
local s            = ls.snippet
local i            = ls.insert_node
local t            = ls.text_node
local r            = ls.restore_node
local extras       = require('luasnip.extras')
local rep          = extras.rep
local conds_expand = require("luasnip.extras.conditions.expand")
local fmta         = require("luasnip.extras.fmt").fmta

local inline       = s("mm", fmta("$ <> $ ", i(1, "inline math")))
local env          = s(
	{
		trig = "en",
		condition = conds_expand.line_begin,
	},
	fmta(
		[[
					\begin{<>} % <>
						<>
					\label{<>}
					\end{<>}
					<>
					]],
		{
			i(1, "environment"),
			i(2, "content summary"),
			i(3, "content"),
			i(4, "label"),
			extras.rep(1),
			i(0)
		}
	)
)
ls.add_snippets("tex", { inline, env }, { type = "autosnippets" })
