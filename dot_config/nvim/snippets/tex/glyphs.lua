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

--------------------
-- Greek letters 
--------------------

-- list of latinized name of the greek letters
local greek = {
	"Alpha",
	"Beta",
	"Gamma",
	"Delta",
	"Epsilon",
	"Zeta",
	"Eta",
	"Theta",
	"Iota",
	"Kappa",
	"Lambda",
	"Mu",
	"Nu",
	"Xi",
	"Omicron",
	"Pi",
	"Rho",
	"Sigma",
	"Tau",
	"Upsilon",
	"Phi",
	"Chi",
	"Psi",
	"Omega",
}

--list of latin version of the letters
local latin = {
	"A",
	"B",
	"G",
	"D",
	"E",
	"Z",
	"H",
	"Q",
	"I",
	"K",
	"L",
	"M",
	"N",
	"X",
	"O",
	"P",
	"R",
	"S",
	"T",
	"Y",
	"F",
	"C",
	"U",
	"W",
}



local lower = string.lower
local insert = table.insert

-- Creating two lists containing all the needed symbols
for index = 1, #latin do
	insert(latin, lower(latin[index]))
	insert(greek, lower(greek[index]))
end

-- Function that returns the LaTeX string that represents the greek letter. It is the word the trigger will be expanded to
local toLaTeX = function(greekletter)
	return "\\" .. greekletter
end

-- Section where I generate the actual snippets
local symbols = {}
for index = 1, #latin do
	local trig = ";" .. latin[index]
	local greek_expand = toLaTeX(greek[index])
	symbols[index] = s(trig, t(greek_expand))
end


ls.add_snippets("tex", symbols, { type = "autosnippets" })
ls.add_snippets("tex", glyphs, { type = "autosnippets" })
