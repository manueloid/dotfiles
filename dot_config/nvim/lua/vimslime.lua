-- lua implementation of the variable
-- let g:slime_target = 'tmux'
vim.g.slime_target = 'screen'
vim.g.slime_dont_ask_default = 1
vim.g.slime_no_mappings = 1

-- lua implementation of the variable
-- let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

vim.g.slime_default_config = {
	sessionname = "julia",
	windowname = 0,
}
