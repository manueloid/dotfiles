local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		'folke/which-key.nvim',
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 250
		end

	},
	'nvim-tree/nvim-web-devicons',    -- Adding web icons
	'williamboman/mason.nvim',        -- Mason Plugin to manage external tools
	'williamboman/mason-lspconfig.nvim', -- Mason Plugin to manage the LSP only
	'neovim/nvim-lspconfig',          -- Language server protocol

	'L3MON4D3/LuaSnip',               -- Snippet engine
	'stevearc/aerial.nvim',           -- Code outline
	'nvim-tree/nvim-tree.lua',        -- File explorer

	-- Completion section
	'hrsh7th/nvim-cmp',                 -- Autocompletion engine to handle all sources
	'hrsh7th/cmp-buffer',               -- Completion source for the current buffer
	'hrsh7th/cmp-nvim-lsp',             -- Completion source for the language server protocol

	'hrsh7th/cmp-nvim-lsp-signature-help', -- Completion source for the language server protocol
	'hrsh7th/cmp-nvim-lua',             -- Completion source for Neovim API
	'hrsh7th/cmp-path',                 -- Completion source for file paths
	'onsails/lspkind.nvim',             -- Better looking symbols in the completion menu
	'saadparwaiz1/cmp_luasnip',         -- Completion source for LuaSnip

	'nvim-lualine/lualine.nvim',
	--  'romgrk/barbar.nvim' -- Tabline
	'akinsho/bufferline.nvim', -- Bufferline

	-- ToggleTerm plugin to handle terminal windows
	'akinsho/toggleterm.nvim',
	-- Smart splits
	{
		'mrjones2014/smart-splits.nvim',
		config = function()
			require('smart-splits').setup({
				resize_mode = { resize_keys = { 's', 'h', 'r', 't' } }
			})
		end
	},

	-- TreeSitter Installation
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	-- VimSlime
	'jpalardy/vim-slime',

	-- VimTex and all LaTeX related plugins
	'lervag/vimtex',
	-- Julia Editor support plugin
	'JuliaEditorSupport/julia-vim',
	{
		'JohnRigoni/codeium.vim',
		event = 'BufEnter',
		config = function()
			vim.keymap.set('i', '<c-t>', function() return vim.fn['codeium#Accept']() end,
				{ expr = true, silent = true })
			vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](1) end,
				{ expr = true, silent = true })
			vim.keymap.set('i', '<c-.>', function() return vim.fn['codeium#CycleCompletions'](1) end,
				{ expr = true, silent = true })
			vim.keymap.set('i', '<c-g>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
			vim.keymap.set('i', '<c-h>', function() return vim.fn['codeium#AcceptWord']() end,
				{ expr = true, silent = true })
			vim.keymap.set('i', '<c-r>', function() return vim.fn['codeium#AcceptLine']() end,
				{ expr = true, silent = true })
		end
	},

	-- The tpope experience
	'tpope/vim-commentary',
	'tpope/vim-fugitive',
	'tpope/vim-repeat',
	'tpope/vim-surround',

	-- Movement Section
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		'ethanholz/nvim-lastplace',
		config = function()
			require('nvim-lastplace').setup {}
		end,
	},

	-- Telescope
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make'
	},
	{
		'nvim-telescope/telescope.nvim',
		-- tag = '0.1.1',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
	},
	'nvim-telescope/telescope-symbols.nvim',
	-- Oil file explorer
	{
		'stevearc/oil.nvim',
		config = function() require('oil').setup() end,
	},
	-- Greeting page with alpha.nvim
	{
		'goolord/alpha-nvim',
		config = function()
			require('alpha').setup(require('alpha.themes.startify').config)
		end,
	},
	-- Colorscheme and extra color options
	'shaunsingh/solarized.nvim', -- Solarized theme
	'folke/tokyonight.nvim',    -- Tokyo night theme
	'lunarvim/horizon.nvim',    -- Horizon theme
	'norcalli/nvim-colorizer.lua', -- Colorizer
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	'voldikss/vim-mma',
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
})
