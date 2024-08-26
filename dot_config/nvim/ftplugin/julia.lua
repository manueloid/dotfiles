vim.g.slime_dont_ask_default = 1
vim.g.slime_default_config = { socket_name = "julia", target_pane = "0" }

-- Will define a sysimage directory to speed up julia startup
local launch = function()
	-- vim.fn.jobstart("contour tmux -Ljulia new julia -J ~/.julia/sysimages/sysimage.so", { detach = true })
	vim.fn.jobstart("contour tmux -Ljulia new julia", { detach = true })
end
vim.keymap.set({'n', 'i'}, '<C-i>', launch, {noremap = true})
