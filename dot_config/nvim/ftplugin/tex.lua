-- Keymap to open the table of contents of the current LaTeX file.
-- vim.api.nvim_set_keymap('n', '<Space>lt', ':VimtexTocToggle<CR>', { noremap = true, silent = true })
-- Keymap to open the quickfix window.
-- vim.api.nvim_set_keymap('n', '<Space>q', ':VimtexErrors<CR>', { noremap = true, silent = true })
-- Keymap to start the compiler
-- vim.api.nvim_set_keymap('n', '<Space>c', ':VimtexCompile<CR>', { noremap = true, silent = true })
-- Set conceal level to 2, so that LaTeX commands are hidden.
-- vim.opt.conceallevel = 2
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 4
vim.g.vimtex_fold_enabled = 1
