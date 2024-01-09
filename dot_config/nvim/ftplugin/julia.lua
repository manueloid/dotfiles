vim.g.slime_cell_delimiter = "^\\s*#"
vim.api.nvim_set_keymap('n', '<leader>jj', '<Plug>SlimeSendCell<CR>', {})
vim.o.foldmethod = 'marker'
vim.o.foldmarker = '#=,=#'
