return {
	noremap = {
		{
			"n",
			"<C-n>",
			require("nvim-tree.api").tree.open,
			{ desc = "Focus File Explorer", silent = true, nowait = true },
		},
		{
			"n",
			"<leader>e",
			function()
				require("nvim-tree.api").tree.toggle({ find_file = true })
			end,
			{ desc = "Toggle File Explorer", silent = true, nowait = true },
		},
	},
}
