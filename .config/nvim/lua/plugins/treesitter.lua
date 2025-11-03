return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "windwp/nvim-ts-autotag" },
		build = ":TSUpdate",
		config = function()
			require("nvim-ts-autotag").setup({
				enable = true,
				filetypes = {
					"html",
					"tsx",
					"typescriptreact",
					"jsx",
					"javascriptreact",
				},
			})

			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				ensure_installed = {
					"vim",
					"vimdoc",
					"lua",
					"markdown",
					"html",
					"css",
					"typescript",
					"javascript",
					"tsx",
					"go",
					"python",
					"rust",
				},
			})
		end,
	},
}
