vim.g.mapleader = ","
local function map(mode, lhs, rhs, options)
	options = { noremap = true, silent = true }
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Disable space in normal mode
-- map('n', ' ', '<NOP>')

-- Vim Slime shortcuts
map('n', '<C-l>', ':SlimeSendCurrentLine <CR>') -- Sends a line to the repl
map('i', '<C-l>', '<C-o>:SlimeSendCurrentLine <CR>')
map('n', '<C-u>', '<Plug>SlimeParagraphSend ')  -- Sends a block to the repl
-- map('i', '<C-u>', '<C-o><Plug>SlimeParagraphSend ')

-- Opening splits of different forms
map("n", "-", ":split<CR>")
map("n", "|", ":vsplit<CR>")

-- Pasting from local clipboard in insert mode
map('i', "<C-p>", "<C-o>p")

-- Keymap to edit the snippet file
map("n", "<M-e>", [[:lua require("luasnip.loaders").edit_snippet_files()<CR>]])

-- Remapping gc to comment the current line
local api = require('Comment.api')
vim.keymap.set('n', '<C-B>', api.toggle.blockwise.current)
vim.keymap.set('n', '<C-G>', api.toggle.linewise.current)

-- Remapping <C-s> to save all the current buffers
map("n", "<C-s>", ":wa<CR>")
map("i", "<C-s>", "<C-o>:wa<CR>")

-- Remapping <C-q> to save and quit all the current buffers
map("n", "<C-q>", ":wqa!<CR>")
map("i", "<C-q>", "<C-o>:wqa!<CR>")
-- Remapping both <space> and <CR> to work in normal mode
vim.api.nvim_set_keymap("n", "<space>", ":", { noremap = false })
-- Remapping the movement keys
map("n", "k", "f")
map("n", "l", "r")
local keys = { 's', 'h', 't', 'r', 'S', 'H', 'T', 'R' }
local movement = { '<Left>', '<Down>', '<Right>', '<Up>', '<C-Left>', '<C-Down>', '<C-Right>', '<C-Up>' }
for i = 1, #keys do
	map("n", keys[i], movement[i])
end

-- The same caveats as above about bidirectional search apply here.
vim.keymap.set('n', 'f', function()
	local focusable_windows_on_tabpage = vim.tbl_filter(
		function(win) return vim.api.nvim_win_get_config(win).focusable end,
		vim.api.nvim_tabpage_list_wins(0)
	)
	require('leap').leap { target_windows = focusable_windows_on_tabpage }
end)

vim.keymap.set('n', '<C-h>', require('smart-splits').resize_left)

