local function lsp_servers(on_attach, on_init, capabilities)
	-- servers to be used with default configs
	local servers = {
		"ts_ls",
		"prismals",
		"html",
		"cssls",
		"gopls",
		"buf_ls",
		"qmlls",
		"tailwindcss",
		"markdown_oxide",
		"vue_ls",
	}

	for _, server in ipairs(servers) do
		vim.lsp.config(server, {
			on_attach = on_attach,
			on_init = on_init,
			capabilities = capabilities,
		})
	end

	-- custom configs for each server
	-- lua
	vim.lsp.config("lua_ls", {
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"ray-x/lsp_signature.nvim",
		},
		init = function()
			local on_attach = require("config.mappings.lsp").on_attach
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local on_init = function(client, _)
				if client.name == "node" and client.config.cmd[1]:match("copilot") then
					client.name = "copilot"
				end
			end

			capabilities.textDocument.completion.completionItem = {
				documentationFormat = { "markdown", "plaintext" },
				snippetSupport = true,
				preselectSupport = true,
				insertReplaceSupport = true,
				labelDetailsSupport = true,
				deprecatedSupport = true,
				commitCharactersSupport = true,
				tagSupport = { valueSet = { 1 } },
				resolveSupport = {
					properties = {
						"documentation",
						"detail",
						"additionalTextEdits",
					},
				},
			}

			lsp_servers(on_attach, on_init, capabilities)
		end,
	},
}
