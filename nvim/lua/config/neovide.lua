if vim.g.neovide then
	vim.g.neovide_normal_opacity = 0.8
	vim.g.neovide_refresh_rate = 165
	vim.g.neovide_cursor_vfx_mode = "pixiedust"

	vim.keymap.set(
		{ "n", "v" },
		"<C-S-V>",
		'"+p==',
		{ desc = "Paste from system clipboard", noremap = true, silent = true }
	)
	vim.keymap.set(
		"i",
		"<C-S-V>",
		'<Esc>"+p==a',
		{ desc = "Paste from system clipboard", noremap = true, silent = true }
	)
end
