-- Map Alt+1 to toggle a floating terminal
require('toggleterm').setup()
vim.api.nvim_set_keymap('n', '<A-1>', ':ToggleTerm size=30 direction=horizontal <CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-2>', ':ToggleTerm size=' .. vim.o.columns * 0.4 .. ' direction=vertical <CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-3>', ':ToggleTerm direction=float <CR>', { noremap = true, silent = true })

-- do the same thing but in terminal mode
vim.api.nvim_set_keymap('t', '<A-1>', '<C-\\><C-n>:ToggleTerm size=30 direction=horizontal <CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-2>', '<C-\\><C-n>:ToggleTerm size=' .. vim.o.columns * 0.4 .. ' direction=vertical <CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-3>', '<C-\\><C-n>:ToggleTerm direction=float <CR>',
	{ noremap = true, silent = true })
