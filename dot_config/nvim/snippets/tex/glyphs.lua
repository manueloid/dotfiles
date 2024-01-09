local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

-- fmta is an utility to write snippets in a more compact way.
local fmta = require("luasnip.extras.fmt").fmta

local in_math = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

-- Make all the following snippets only available in math mode.
s = ls.extend_decorator.apply(s, { wordTrig = false, condition = in_math })

local glyphs = {
	s("uu", fmta("^{<>}", i(1))),
	s("hh", fmta("_{<>}", i(1))),
	s("uh", fmta("_{<>}^{<>}", { i(1), i(2) })),
	s("hu", fmta("_{<>}^{<>}", { i(1), i(2) })),
	s("//", fmta("\\frac{<>}{<>}", { i(1, "numerator"), i(2, "denominator") })),
	s("sq", fmta("\\sqrt{<>}", i(1))),
	s("hb", t("\\hbar")),
}

ls.add_snippets("tex", glyphs, { type = "autosnippets" })
