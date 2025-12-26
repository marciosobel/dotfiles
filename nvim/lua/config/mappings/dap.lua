return {
	map = {
		{ "n", "<leader>db", require("dap").toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" } },
		{ "n", "<leader>dc", require("dap").continue, { desc = "DAP Continue" } },
		{ "n", "<leader>dr", require("dap").repl.open, { desc = "DAP Open REPL" } },
		{ "n", "<leader>dk", require("dap").terminate, { desc = "DAP Kill" } },
		{ "n", "<leader>dso", require("dap").step_over, { desc = "DAP Step Over" } },
		{ "n", "<leader>dsi", require("dap").step_into, { desc = "DAP Step Into" } },
		{ "n", "<leader>dsu", require("dap").step_out, { desc = "DAP Step Out" } },
		{ "n", "<leader>dl", require("dap").run_last, { desc = "DAP Run Last" } },
		{ "n", "<leader>duu", require("dapui").toggle, { desc = "DAP Open UI" } },
		{ "n", "<leader>dgdt", require("dap-go").debug_test, { desc = "DAP GO Debug Test" } },
	},
}
