return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		opts = {
			defaults = {
				prompt_prefix = "   ",
				-- selection_caret = " ",
				-- entry_prefix = "  ",
				selection_caret = " ",
				entry_prefix = " ",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "bottom",
						preview_width = 0.55,
					},
					width = 0.75,
					height = 0.85,
				},
				mappings = {
					n = { ["q"] = require("telescope.actions").close },
				},
				-- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				-- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
			},

			extensions_list = { "themes", "terms" },
			extensions = {
				["ui-select"] = {},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			telescope.load_extension("ui-select")
		end,
	},
}
