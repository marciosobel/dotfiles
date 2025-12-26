return {
	{
		"thesimonho/kanagawa-paper.nvim",
		name = "kanagawa-paper",
		lazy = true,
		opts = {
			cache = true,
			dim_inactive = false,
			overrides = function(colors)
				return {
					NormalFloat = { bg = colors.palette.sumiInk3 },
					FloatBorder = { bg = colors.palette.sumiInk3 }, --  fg = colors.palette.sumiInk4
					WinSeparator = { fg = colors.palette.sumiInk4 },
				}
			end,
		},
	},
	{
		"rebelot/kanagawa.nvim",
		name = "kanagawa",
		lazy = true,
		opts = {
			cache = true,
			dimInactive = false,
			overrides = function(colors)
				return {
					NormalFloat = { bg = colors.palette.sumiInk3 },
					FloatBorder = { bg = colors.palette.sumiInk3, fg = colors.palette.sumiInk4 },
				}
			end,
		},
	},
	{ "catppuccin/nvim", name = "catppuccin", lazy = true },
	{ "EdenEast/nightfox.nvim", name = "nightfox", lazy = true },
	{ "atelierbram/Base2Tone-nvim", lazy = true },
	{ "sainnhe/gruvbox-material", lazy = true },
}
