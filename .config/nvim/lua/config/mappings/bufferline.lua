return {
	map = {
		{ "n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Go to next tab" } },
		{ "n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Go to previous tab" } },
		{ "n", "<Leader>x", "<cmd>bdelete<CR>", { desc = "Close current tab" } },
		{
			"n",
			"<Leader>tbl",
			function()
				---@diagnostic disable-next-line: undefined-field
				local current = vim.opt.showtabline:get()
				local new = current == 2 and 0 or 2
				vim.opt.showtabline = new
			end,
			{ desc = "Toggle bufferline" },
		},
	},
}
