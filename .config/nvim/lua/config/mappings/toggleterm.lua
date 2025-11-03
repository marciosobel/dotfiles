return {
	map = {
		{ { "n", "t" }, "<M-i>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Floating Terminal", silent = true } },
		{
			"n",
			"<leader>h",
			function()
				local Terminal = require("toggleterm.terminal").Terminal
				Terminal:new({
					direction = "horizontal",
					height = function()
						return math.floor(vim.o.lines * 0.4)
					end,
				}):toggle()
			end,
			{ desc = "Open Horizontal terminal", silent = true },
		},
		{
			"n",
			"<leader>v",
			function()
				local Terminal = require("toggleterm.terminal").Terminal
				Terminal:new({
					direction = "vertical",
					width = 100,
				}):toggle()
			end,
			{ desc = "Open Vertical terminal", silent = true },
		},
	},
}
