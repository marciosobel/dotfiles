return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			sections = {
				lualine_a = { { "mode", separator = { right = "" } } },
				lualine_b = {
					{ "branch", icon = "", separator = { right = "" } },
				},
				lualine_c = {
					{ "filename", separator = { right = "" } },
					{ "diagnostics", separator = { left = "" } },
				},
				lualine_x = {
					function()
						local clients = vim.lsp.get_clients()

						if not next(clients) then
							return ""
						end

						local client_names = {}
						local has_copilot = false
						for _, client in ipairs(clients) do
							if
								client.name == "GitHub Copilot"
								and client.config.cmd[2]
								and client.config.cmd[2]:match("copilot%-language%-server")
							then
								has_copilot = true
							else
								table.insert(client_names, client.name)
							end
						end

						local names = table.concat(client_names, ", ")
						local symbol = "󰣖 "
						local servers = symbol .. names

						if has_copilot then
							local copilot_symbol = "  "
							servers = symbol .. copilot_symbol .. names
						end

						return servers
					end,
				},
				lualine_y = { { "filetype", separator = { left = "" } } },
				lualine_z = { { "location", separator = { left = "" }, padding = { right = 1, left = 0 } } },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "nvim-tree" },
		},
	},
}
