return {
	{
		"thesimonho/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
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
		init = function()
			vim.cmd.colorscheme("kanagawa-paper")
		end,
	},
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	opts = {
	-- 		dimInactive = false,
	-- 		overrides = function(colors)
	-- 			return {
	-- 				NormalFloat = { bg = colors.palette.sumiInk3 },
	-- 				FloatBorder = { bg = colors.palette.sumiInk3, fg = colors.palette.sumiInk4 },
	-- 			}
	-- 		end,
	-- 	},
	-- 	init = function()
	-- 		vim.cmd.colorscheme("kanagawa-dragon")
	-- 	end,
	-- },
}
