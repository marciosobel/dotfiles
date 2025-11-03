return {
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false, -- This plugin is already lazy
		init = function()
			local on_attach = require("config.mappings.lsp").on_attach

			vim.g.rustfmt_autosave = 1
			vim.g.rustaceanvim = {
				server = {
					on_attach = on_attach,
				},
				default_settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						inlayHints = {
							enable = false,
						},
					},
				},
			}
		end,
	},
}
