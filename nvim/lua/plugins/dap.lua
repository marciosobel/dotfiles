local setupTypescript = function(dap)
	dap.adapters["pwa-node"] = {
		type = "server",
		host = "localhost",
		port = 8123,
		executable = {
			command = "js-debug-adapter",
		},
	}

	for _, language in ipairs({ "typescript", "javascript" }) do
		dap.configurations[language] = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
				runtimeExecutable = "node",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
		}
	end
end

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = { "jay-babu/mason-nvim-dap.nvim" },
		init = function()
			local dap = require("dap")
			setupTypescript(dap)
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "williamboman/mason.nvim" },
	},
	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},
}
