-- Series of snippets that I am going to define block of codes,
-- like function documentation and so on.
local ls           = require('luasnip')
local s            = ls.snippet
local i            = ls.insert_node
local conds_expand = require("luasnip.extras.conditions.expand")
local extras       = require('luasnip.extras')
local rep          = extras.rep
local fmta         = require("luasnip.extras.fmt").fmta

local section      = s("ss",
	fmta([[
   #=
   <>
   =#
   <>
   ]],
		{
			i(1, "Section title"),
			i(0)
		}),
	{
		condition = conds_expand.line_begin
	}
)

local doc_func    = s(
	{
		trig = "df",
		condition = conds_expand.line_begin,
	},
	fmta(
		[[
	"""
		<>
	<>
	"""
	function <>
		<>
	end
	<>
	]],
		{
			rep(1),
			i(2, "documentation"),
			i(1, "function name"),
			i(3, "function body"),
			i(0)
		})
)

ls.add_snippets("julia",
	{
		-- s("rd", t("|>")), --Shorthand for ReDiRect
		-- s("ass", t("->")), -- Shorthand for ASSignment
		-- s("sqr", t("√")), --Shorthand for SQRt
		section,
		doc_func,
	},
	{ type = "autosnippets" }
)
