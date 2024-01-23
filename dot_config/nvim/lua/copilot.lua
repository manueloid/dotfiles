vim.cmd([[imap <silent><script><expr> <Right> copilot#Accept("\<Right>")]])
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false
})
vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = { markdown = true, gitcommit = true }
