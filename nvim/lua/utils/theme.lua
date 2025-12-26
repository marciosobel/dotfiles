local M = {
	themes = {
		catppuccin = {
			scheme = "catppuccin",
			type = "dark",
		},
		kanagawa = {
			scheme = "kanagawa",
			type = "dark",
		},
		kanagawa_paper = {
			scheme = "kanagawa-paper",
			type = "dark",
		},
		nightfox = {
			scheme = "nightfox",
			type = "dark",
		},
		carbonfox = {
			scheme = "carbonfox",
			type = "dark",
		},
		duskfox = {
			scheme = "duskfox",
			type = "dark",
		},
		nordfox = {
			scheme = "nordfox",
			type = "dark",
		},
		terafox = {
			scheme = "terafox",
			type = "dark",
		},
		base2tone_desert_dark = {
			scheme = "base2tone_desert_dark",
			type = "dark",
		},
		gruvbox_material = {
			scheme = "gruvbox-material",
			type = "dark",
		},

		-- LIGHT THEMES
		dayfox = {
			scheme = "dayfox",
			type = "light",
		},
		dawnfox = {
			scheme = "dawnfox",
			type = "light",
		},
	},
}

M.set = function(theme)
	local name = theme.scheme
	if theme == M.themes.catppuccin then
		require("catppuccin").setup({ flavour = "mocha" })
	elseif theme == M.themes.kanagawa then
		require("kanagawa").load("dragon")
	elseif theme == M.themes.kanagawa_paper then
		name = "kanagawa-paper"
	end

	vim.cmd.colorscheme(name)
	vim.o.background = theme.type
end

M.default = M.themes.duskfox
M.set_default = function(theme)
	M.default = theme
	M.set(theme)
end
M.reset = function()
	M.set(M.default)
end

M.theme_path = { vim.fn.stdpath("config"), "lua", "utils", "default-theme" }

M.load_default = function()
	local default_theme, ok = io.open(table.concat(M.theme_path, "/"), "rb")
	if not default_theme then
		error("Could not open default theme file: " .. tostring(ok))
		return
	end

	local theme = default_theme:read("l")
	default_theme:close()

	for k, v in pairs(M.themes) do
		if v.scheme == theme then
			M.set_default(M.themes[k])
			return
		end
	end

	error("Default theme in file is not valid: " .. tostring(theme))
end

M.save_default = function()
	local file, ok = io.open(table.concat(M.theme_path, "/"), "w+")
	if not file then
		error("Could not open default theme file: " .. tostring(ok))
		return
	end

	file:write(M.default.scheme)
	file:close()
end

return M
