local function add(a, b)
	return a + b
end
local _ = add(1, 2)

return {
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			hint_prefix = "󰄛 ",
			bind = true,
			hint_inline = function()
				return "eol"
			end,
		},
	},
}
