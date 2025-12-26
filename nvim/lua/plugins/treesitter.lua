return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "windwp/nvim-ts-autotag" },
		build = ":TSUpdate",
		opts = {
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
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					scope_incremental = false,
					node_decremental = "<S-CR>",
				},
			},
		},
		config = function(_, opts)
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

			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
