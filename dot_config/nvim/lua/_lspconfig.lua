require("mason").setup()           -- Broader Mason Plugin
require("mason-lspconfig").setup() -- Specific Mason Plugin to handle LSP
-- Key Mappings
local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', '<leader>F', vim.lsp.buf.format, bufopts)
	vim.diagnostic.config({ signs = false })
end

require("lspconfig").lua_ls.setup { -- Setup and configuration for the lua LSP
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	},
	on_attach = on_attach }

-- require("lspconfig").texlab.setup { on_attach = on_attach }   -- Setup and configuration for the tex LSP

--Enable (broadcasting) snippet capability for completion
-- Do this only for html and css
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = { "julials", "marksman", "pyright", "texlab", "csharp_ls", "clangd"}
for _, server in ipairs(servers) do
	require("lspconfig")[server].setup { on_attach = on_attach }
end
local servers_snip = { "html", "cssls" }
for _, server in ipairs(servers_snip) do
	require("lspconfig")[server].setup { on_attach = on_attach, capabilities = capabilities }
end

local nvim_lsp = require('lspconfig')
local configs = require('lspconfig.configs')

configs.lsp_wl = {
  default_config = {
    cmd = {
      "wolfram",
      "kernel",
      "-noinit",
      "-noprompt",
      "-nopaclet",
      "-noicon",
      "-nostartuppaclets",
      "-run",
      'Needs["LSPServer`"];LSPServer`StartServer[]',
    },
    filetypes = { "mma", "wl" },
    root_dir = nvim_lsp.util.path.dirname,
  },
}

nvim_lsp.lsp_wl.setup({ on_attach = on_attach })
