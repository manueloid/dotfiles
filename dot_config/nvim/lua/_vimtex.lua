vim.g.compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = {
	aux_dir = "latex_build",
	out_dir = "latex_build",
}
vim.g.vimtex_view_general_viewer = "zathura"
-- Disable automatic opening of the quickfix window
vim.g.vimtex_quickfix_open_on_warning = 0
