return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		init = function(_, opts)
			local harpoon = require("harpoon")
			harpoon:setup(opts)

			local extensions = require("harpoon.extensions")
			harpoon:extend(extensions.builtins.highlight_current_file())
		end,
	},
}
