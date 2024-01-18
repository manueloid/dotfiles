vim.cmd([[imap <silent><script><expr> <Right> copilot#Accept("\<Right>")]])
vim.g.copilot_no_tab_map = "v:true"
vim.g.copilot_filetypes = { markdown = true, gitcommit = true }
