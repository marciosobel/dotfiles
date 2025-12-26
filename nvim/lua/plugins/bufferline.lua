return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				mode = "buffers",
				separator_style = "thin",
				show_close_icon = false,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level)
					local icon = ""
					if level:match("error") then
						icon = " "
					elseif level:match("warn") then
						icon = " "
					elseif level:match("info") then
						icon = " "
					elseif level:match("hint") then
						icon = "󰌵 "
					end
					return icon .. count
				end,
			},
		},
	},
}
