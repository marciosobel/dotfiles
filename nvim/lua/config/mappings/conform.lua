return {
	map = {
		{
			"n",
			"<leader>fm",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format buffer",
		},
	},
}
