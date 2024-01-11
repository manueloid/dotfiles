-- Snippet configuration
local ls = require("luasnip")
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

-- Snippet engine setup
ls.config.set_config({
	history = true,                           -- Remembers the last position of the cursor in a node
	update_events = "TextChanged, TextChangedI", -- Updates the content of a node every time text is changed
	enable_autosnippets = true,               -- Allow snippets to automatically expand
})


-- AutoCompletion configuration
local cmp = require("cmp")
local lspkind = require("lspkind") -- Plugin to have better symbols in the completion menu
cmp.setup({
	snippet = {
		function(args) ls.lsp_expand(args.body) end,
	},
	mapping = {
		-- Confirm selection
		["<CR>"] = cmp.mapping({
			i = function(fallback)
				if cmp.visible() and cmp.get_active_entry() then
					cmp.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					})
				else
					fallback()
				end
			end,
			s = cmp.mapping.confirm({ select = true }),
			c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		}),
		-- Open the completion menu
		["<C-n>"] = cmp.mapping.complete(),
		-- Close the completion menu
		["<C-r>"] = cmp.mapping.abort(),
		-- Select next object
		["<Down>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		-- Select previous object
		["<Up>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
		-- Jump to next snippet
		["rw"] = cmp.mapping(function(fallback)
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		-- Jump to previous snippet
		["wr"] = cmp.mapping(function(fallback)
			if ls.jumpable(-1) then
				ls.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp', },
		{ name = 'buffer', },
		{ name = 'path' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'luasnip' },
	}),
	formatting = {
		fields = { "kind", "abbr" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"
			return kind
		end,
	},
	window = {
		winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
		col_offset = -3,
		side_padding = 0,
		completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
})
