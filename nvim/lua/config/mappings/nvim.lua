return {
	noremap = {
		{ "n", "Q", "<nop>" },
		{ "n", "<C-d>", "<C-d>zz" },
		{ "n", "<C-u>", "<C-u>zz" },
		{ "n", "n", "nzzzv" },
		{ "n", "N", "Nzzzv" },
		{ "x", "<leader>p", '"_dP', { desc = "Paste without overwritting current buffer" } },
		{ "n", "<leader>D", '"_d', { desc = "Delete without overwritting current buffer" } },
		{ "v", "<leader>D", '"_d', { desc = "Delete without overwritting current buffer" } },
		{ "n", "<leader>/", "gcc", { desc = "Toggle comment" } },
		{ "v", "<leader>/", "gc", { desc = "Toggle comment" } },
		{ "n", "<leader>sph", "<C-w>s", { desc = "Split window horizontally " } },
		{ "n", "<leader>spv", "<C-w>v", { desc = "Split window vertically " } },
		{ "n", "<C-s>", "<cmd>w<CR>", { desc = "Save buffer changes to file" } },
		{ "n", "<C-h>", "<C-w>h", { desc = "Move to left window" } },
		{ "n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" } },
		{ "n", "<C-k>", "<C-w>k", { desc = "Move to top window" } },
		{ "n", "<C-l>", "<C-w>l", { desc = "Move to right window" } },
		{ "n", "<leader>kt", require("utils").change_colorscheme, { desc = "Change current colorscheme" } },
	},
	map = {
		{ "n", "<leader>X", '<cmd>%bdelete|edit #|normal`"<CR>', { desc = "Close all buffers except current" } },
		{ "n", "<leader>y", '"+y', { desc = "Copy to system clipboard" } },
		{ "v", "<leader>y", '"+y', { desc = "Copy to system clipboard" } },
		{ "n", "<leader>Y", '"+Y', { desc = "Copy line to system clipboard" } },
		{
			"n",
			"<leader>fd",
			function()
				vim.diagnostic.open_float()
			end,
			{ desc = "Show diagnostics" },
		},
	},
}
