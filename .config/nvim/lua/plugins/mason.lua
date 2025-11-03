return {
	{
		"williamboman/mason.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local ensure_installed = {
				-- LSPs
				"lua-language-server",

				-- formatters
				"stylua",
			}

			require("mason").setup()
			require("mason-lspconfig").setup({
				automatic_installation = true,
			})

			-- source: https://github.com/williamboman/mason-lspconfig.nvim/issues/113#issuecomment-1471346816
			local registry = require("mason-registry")

			for _, pkg_name in ipairs(ensure_installed) do
				local ok, pkg = pcall(registry.get_package, pkg_name)
				if ok then
					if not pkg:is_installed() then
						pkg:install()
					end
				end
			end
		end,
	},
}
