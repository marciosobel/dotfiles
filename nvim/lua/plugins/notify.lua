return {
	{
		"rcarriga/nvim-notify",
		opts = {
			fps = 165,
			render = "wrapped-compact",
			stages = "slide",
			top_down = false,
			max_width = 120,
			max_height = 25,
		},
		config = function(_, opts)
			local notify = require("notify")
			vim.notify = notify
			notify.setup(opts)
		end,
	},
}
