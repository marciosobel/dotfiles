return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			sync_root_with_cwd = true,
			disable_netrw = true,
			hijack_cursor = true,
			live_filter = { prefix = " ", always_show_folders = false },
			filters = { custom = { "^\\.git$" }, dotfiles = false },
			view = { side = "left", width = 40, preserve_window_proportions = true },
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")
				api.config.mappings.default_on_attach(bufnr)
			end,
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			renderer = {
				root_folder_label = false,
				icons = {
					glyphs = {
						git = { ignored = "" },
					},
				},
			},
		},
	},
}
