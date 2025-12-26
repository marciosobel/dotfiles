return {
	map = {
		{ "n", "<leader>gs", require("telescope.builtin").git_status, { desc = "Telescope git status" } },
		{ "n", "<leader>gcb", require("telescope.builtin").git_branches, { desc = "Telescope git branches" } },
		{ "n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Telescope buffers" } },
		{ "n", "<leader>fad", require("telescope.builtin").diagnostics, { desc = "Telescope all LSP diagnostics" } },
		{
			"n",
			"<C-f>",
			require("telescope.builtin").current_buffer_fuzzy_find,
			{ desc = "Telescope find in current buffer" },
		},
		{
			"n",
			"<leader>ff",
			function()
				local telescope = require("telescope.builtin")

				if not pcall(telescope.git_files, { show_untracked = true }) then
					telescope.find_files({ follow = true })
				end
			end,
			{ desc = "Telescope find files" },
		},
		{
			"n",
			"<leader>faf",
			function()
				require("telescope.builtin").find_files({ follow = true, hidden = true, no_ignore = true })
			end,
			{ desc = "Telescope find all files" },
		},
		{
			"n",
			"<leader>fn",
			function()
				require("telescope").extensions.notify.notify()
			end,
		},
	},
}
