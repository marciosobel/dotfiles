return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePost" },
		config = function()
			require("lint").linters_by_ft = {
				lua = { "luacheck" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
			}
		end,
	},
}
