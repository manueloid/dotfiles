require('aerial').setup({
	layout = {
		min_width = 20,
		default_direction = "left",
	},
	nav = {
		keymaps =
		{
				['<Left>'] = "actions.left",
				['<Right>'] = "actions.right",
				['q'] = "actions.close",
		}
	}
})
