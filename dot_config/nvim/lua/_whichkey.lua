local wk = require('which-key')

require('which-key').setup({
	triggers = { "<leader>" }, -- Only start when pressing leader
	window = {
		border = "double"
	}
})

wk.register({
	-- Telescope keymapping
		["<leader>t"] = {
		name = "+Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		s = { "<cmd>Telescope symbols<cr>", "Symbols" },
	},
	-- Aerial
		["<leader>a"] = {
		name = "+Aerial",
		a = { "<cmd>AerialToggle!<cr>", "Toggle Aerial" },
		A = { "<cmd>AerialOpenAll<cr>", "Open all" },
		n = { "<cmd>AerialNavToggle<cr>", "Toggle Navigation Window" },
	},
	-- Window management
		["<leader>w"] = {
		name = "+Window",
		r = { "<cmd>wincmd k<cr>", "Window up" },
		h = { "<cmd>wincmd j<cr>", "Window down" },
		s = { "<cmd>wincmd h<cr>", "Window left" },
		t = { "<cmd>wincmd l<cr>", "Window right" },
		q = { "<cmd>wincmd q<cr>", "Window quit" },
	},
	-- Windows resizing 
		["<leader>r"] = {
		name = "+Resize",
		r = { "<cmd> lua require('smart-splits').resize_up(5)<cr>", "Resize up" },
		h = { "<cmd> lua require('smart-splits').resize_down(5)<cr>", "Resize down" },
		s = { "<cmd> lua require('smart-splits').resize_left(5)<cr>", "Resize left" },
		t = { "<cmd> lua require('smart-splits').resize_right(5)<cr>", "Resize right" },
		m = { "<cmd> lua require('smart-splits').start_resize_mode()<cr>", "Start resizing mode" },
		a = { "<C-w>=", "Equalize windows" },
	},
		-- Buffer management
		["<leader>b"] = {
		name = "+Buffer",
		p = { "<cmd>BufferLineCyclePrev<cr>", "Next Buffer" },
		n = { "<cmd>BufferLineCycleNext<cr>", "Previous Buffer" },
		c = { "<cmd>BufferLinePick<cr>", "Choose Buffer" },
		d = { "<cmd>BufferLinePickClose<cr>", "Close selected Buffer" },
		q = { "<cmd>bd<cr>", "Close Buffer" },
		Q = { "<cmd>BufferLineCloseOthers<cr>", "Close all but current" },
		l = { "<cmd>buffers<cr>", "List Buffers" },
	},
	-- File explorer with neovim tree
		["<leader>e"] = {
		name = "+Explorer",
		e = { "<cmd>NvimTreeToggle<cr>", "Toggle Explorer" },
		r = { "<cmd>NvimTreeRefresh<cr>", "Refresh Explorer" },
		t = { "<cmd>NvimTreeResize +10<cr>", "Increase Explorer Width" },
		s = { "<cmd>NvimTreeResize -10<cr>", "Decrease Explorer Width" },
	},
	-- Git and fugitive
		["<leader>g"] = {
		name = "+Git",
		g = { "<cmd>Git<cr>", "Git" },
		a = { "<cmd>Git add %<cr>", "Git add" },
		c = { "<cmd>Git add * | Git commit<cr>", "Git add and commit everything" },
		A = { "<cmd>Git add *<cr>", "Git add all" },
	},
	-- Oil file explorer
		["<leader>o"] = {
		name = "+Oil",
		o = { "<cmd>Oil<cr>", "Oil" },
		f = { "<cmd>Oil --float<cr>", "Oil float" },
	},
	-- Vimtex Setup
		["<leader>l"] = {
		name = "+VimTex",
		t = { "<cmd>VimtexTocToggle<cr>", "Toggle TOC" },
		e = { "<cmd>VimtexErrors<cr>", "Toggle Errors" },
		c = { "<cmd>VimtexCompile<cr>", "Compile this document" }
	}
})
