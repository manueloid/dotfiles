local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta

-- Unicode symbols for the greek letters
local greek_unicode = {
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

-- list of latin version of the letters
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

-- Creating a list with all the latin trigger symbols
for index = 1, #latin do
    insert(latin, lower(latin[index]))
end

-- Function that creates the string that will then be used to trigger the command (i.e ;a -> \α)
local totrigger = function(trigger_sym, letter)
    return trigger_sym .. letter
end

-- Section where I generate the actual snippets
local symbols = {}
for index = 1, #latin do
    local latin_trig = totrigger(";", latin[index])
    symbols[index] = s({trig = latin_trig, wordTrig = false}, t(greek_unicode[index]))
end

ls.add_snippets("julia", symbols, { type = "autosnippets" })
ls.add_snippets("wolfram", symbols, { type = "autosnippets" })
ls.add_snippets("python", symbols, { type = "autosnippets" })
ls.add_snippets("markdown", symbols, { type = "autosnippets" })
