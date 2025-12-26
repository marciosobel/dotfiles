local mappings = {
	map = {
		{ "n", "gD", vim.lsp.buf.declaration, { desc = "LSP Go to declaration" } },
		{ "n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to definition" } },
		{ "n", "gi", vim.lsp.buf.implementation, { desc = "LSP Go to implementation" } },
		{ "n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "LSP Show signature help" } },
		{ "n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "LSP Add workspace folder" } },
		{ "n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "LSP Remove workspace folder" } },
		{ "n", "<leader>D", vim.lsp.buf.type_definition, { desc = "LSP Go to type definition" } },
		{
			"n",
			"<leader>wl",
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			{ desc = "LSP List workspace folders" },
		},
		{ { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code action" } },
		{ "n", "gr", vim.lsp.buf.references, { desc = "LSP Show references" } },
	},
}

local on_attach = function(_, bufnr)
	local function handle_mappings(mapping, noremap)
		for _, map in ipairs(mapping) do
			local mode, lhs, rhs, opts = unpack(map)
			opts = opts or {}
			opts.noremap = noremap or false
			opts.buffer = bufnr
			vim.keymap.set(mode, lhs, rhs, opts)
		end
	end

	if mappings.map then
		handle_mappings(mappings.map)
	end
	if mappings.noremap then
		handle_mappings(mappings.noremap, true)
	end

	require("lsp_signature").setup({ bind = true }, bufnr)
end

return {
	on_attach = on_attach,
}

