local wk = require('which-key')

vim.api.nvim_create_user_command('Tips', function()
	local filetype = vim.bo.filetype
	local filename = os.getenv("HOME") .. "/Repos/Tricks/" .. filetype .. ".md"
	vim.cmd("e " .. filename)
end, {nargs = '*'})
require('which-key').setup({
	triggers = { "<leader>" }, -- Only start when pressing leader
	win = {
		border = "double"
	}
})

--[[
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
	},
	-- Codeium Chat
		["<leader>c"] = {
		name = "+Codeium",
		c = { "<cmd>call codeium#Chat()<cr>", "Chat" },
	},
	-- Tips
		['<leader>s']  = {
			name = '+Tips',
			s = { '<cmd>Tips<cr>', 'Tips' }
		},
})
--]]
wk.add({
    { "<leader>a", group = "Aerial" },
    { "<leader>aA", "<cmd>AerialOpenAll<cr>", desc = "Open all" },
    { "<leader>aa", "<cmd>AerialToggle!<cr>", desc = "Toggle Aerial" },
    { "<leader>an", "<cmd>AerialNavToggle<cr>", desc = "Toggle Navigation Window" },
    { "<leader>b", group = "Buffer" },
    { "<leader>bQ", "<cmd>BufferLineCloseOthers<cr>", desc = "Close all but current" },
    { "<leader>bc", "<cmd>BufferLinePick<cr>", desc = "Choose Buffer" },
    { "<leader>bd", "<cmd>BufferLinePickClose<cr>", desc = "Close selected Buffer" },
    { "<leader>bl", "<cmd>buffers<cr>", desc = "List Buffers" },
    { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Previous Buffer" },
    { "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Next Buffer" },
    { "<leader>bq", "<cmd>bd<cr>", desc = "Close Buffer" },
    { "<leader>c", group = "Codeium" },
    { "<leader>cc", "<cmd>call codeium#Chat()<cr>", desc = "Chat" },
    { "<leader>e", group = "Explorer" },
    { "<leader>ee", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" },
    { "<leader>er", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh Explorer" },
    { "<leader>es", "<cmd>NvimTreeResize -10<cr>", desc = "Decrease Explorer Width" },
    { "<leader>et", "<cmd>NvimTreeResize +10<cr>", desc = "Increase Explorer Width" },
    { "<leader>g", group = "Git" },
    { "<leader>gA", "<cmd>Git add *<cr>", desc = "Git add all" },
    { "<leader>ga", "<cmd>Git add %<cr>", desc = "Git add" },
    { "<leader>gc", "<cmd>Git add * | Git commit<cr>", desc = "Git add and commit everything" },
    { "<leader>gg", "<cmd>Git<cr>", desc = "Git" },
    { "<leader>l", group = "VimTex" },
    { "<leader>lc", "<cmd>VimtexCompile<cr>", desc = "Compile this document" },
    { "<leader>le", "<cmd>VimtexErrors<cr>", desc = "Toggle Errors" },
    { "<leader>lt", "<cmd>VimtexTocToggle<cr>", desc = "Toggle TOC" },
    { "<leader>o", group = "Oil" },
    { "<leader>of", "<cmd>Oil --float<cr>", desc = "Oil float" },
    { "<leader>oo", "<cmd>Oil<cr>", desc = "Oil" },
    { "<leader>r", group = "Resize" },
    { "<leader>ra", "<C-w>=", desc = "Equalize windows" },
    { "<leader>rh", "<cmd> lua require('smart-splits').resize_down(5)<cr>", desc = "Resize down" },
    { "<leader>rm", "<cmd> lua require('smart-splits').start_resize_mode()<cr>", desc = "Start resizing mode" },
    { "<leader>rr", "<cmd> lua require('smart-splits').resize_up(5)<cr>", desc = "Resize up" },
    { "<leader>rs", "<cmd> lua require('smart-splits').resize_left(5)<cr>", desc = "Resize left" },
    { "<leader>rt", "<cmd> lua require('smart-splits').resize_right(5)<cr>", desc = "Resize right" },
    { "<leader>s", group = "Tips" },
    { "<leader>ss", "<cmd>Tips<cr>", desc = "Tips" },
    { "<leader>t", group = "Telescope" },
    { "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>ts", "<cmd>Telescope symbols<cr>", desc = "Symbols" },
    { "<leader>w", group = "Window" },
    { "<leader>wh", "<cmd>wincmd j<cr>", desc = "Window down" },
    { "<leader>wq", "<cmd>wincmd q<cr>", desc = "Window quit" },
    { "<leader>wr", "<cmd>wincmd k<cr>", desc = "Window up" },
    { "<leader>ws", "<cmd>wincmd h<cr>", desc = "Window left" },
    { "<leader>wt", "<cmd>wincmd l<cr>", desc = "Window right" },
  })
