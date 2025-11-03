return {
	{
		"akinsho/toggleterm.nvim",
		opts = {
			direction = "float",
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.3
				end
			end,
			float_opts = {
				border = "rounded",
				title_pos = "left",
			},
		},
	},
}
