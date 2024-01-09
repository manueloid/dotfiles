local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node

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

-- Greek lower symbols that will input from the Greek keyboard layout
local greek_symbols_lower = {
	"α",
	"β",
	"γ",
	"δ",
	"ε",
	"ζ",
	"η",
	"θ",
	"ι",
	"κ",
	"λ",
	"μ",
	"ν",
	"ξ",
	"ο",
	"π",
	"ρ",
	"σ",
	"τ",
	"υ",
	"φ",
	"χ",
	"ψ",
	"ω",
}

-- Similar thing but for the upper case
local greek_symbols = {
	"Α",
	"Β",
	"Γ",
	"Δ",
	"Ε",
	"Ζ",
	"Η",
	"Θ",
	"Ι",
	"Κ",
	"Λ",
	"Μ",
	"Ν",
	"Ξ",
	"Ο",
	"Π",
	"Ρ",
	"Σ",
	"Τ",
	"Υ",
	"Φ",
	"Χ",
	"Ψ",
	"Ω",
}

local lower = string.lower
local insert = table.insert

-- Now I will join the two lists together
for index = 1, #greek_symbols_lower do
	insert(greek_symbols, greek_symbols_lower[index])
end


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
	local trig = greek_symbols[index]
	local greek_expand = toLaTeX(greek[index])
	symbols[index] = s(trig, t(greek_expand))
end

ls.add_snippets("tex", symbols, { type = "autosnippets" })
