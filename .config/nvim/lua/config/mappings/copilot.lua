return {
	noremap = {
		{
			"i",
			"<C-f>",
			function()
				vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
			end,
			{ desc = "Accept Copilot suggestion" },
		},
	},
}
