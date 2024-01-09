-- Autofolding mechanism using Treesitter
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Options to have the relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- set up the cursorline
vim.opt.cursorline = true
-- ignore case when searching
vim.opt.ignorecase = true

-- Decrease tab stop
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Disable automatic commenting
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	desc = "Disable automatic commenting",
})

-- Setting termgui colors
vim.opt.termguicolors = true
require('colorizer').setup()
-- Automatically copy yanked text to system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Setting up solarized colorscheme
vim.cmd("colorscheme horizon")
-- Setting up the bufferline
-- vim.opt.termguicolors = true
require('bufferline').setup({})

-- usign xdg-open to open files like pdfs and images
local files = { "pdf", "png", "jpg", "jpeg", "gif" }
	for _, file in ipairs(files) do
		vim.cmd("autocmd BufEnter *." .. file .. " execute '!xdg-open % &' | bdelete %")
	end
