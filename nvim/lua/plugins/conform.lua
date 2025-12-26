return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		--@module "conform"
		--@type conform.setupOpts
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "gofmt", "goimports" },
				typescript = { "prettier", "prettierd" },
				javascript = { "prettier", "prettierd" },
				typescriptreact = { "prettier", "prettierd" },
				javascriptreact = { "prettier", "prettierd" },
				vue = { "prettier", "prettierd" },
				java = { "google-java-format" },
				python = { "black" },
			},
			defult_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = { timeout_ms = 500 },
		},
	},
}
