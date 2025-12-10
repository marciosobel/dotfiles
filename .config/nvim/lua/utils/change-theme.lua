local function create_buffer_previewer(theme)
	local current_buffer = vim.api.nvim_get_current_buf()

	return require("telescope.previewers").new_buffer_previewer({
		title = "Preview",
		define_preview = function(self, entry)
			local table_string = vim.inspect(theme.themes[entry.value])
			local t = load("return " .. table_string)()
			theme.set(t)

			local bufnr = self.state.bufnr
			local lines = vim.api.nvim_buf_get_lines(current_buffer, 0, -1, false)
			vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

			local ft = vim.bo[current_buffer].filetype
			vim.bo[self.state.bufnr].filetype = ft
		end,
		teardown = theme.set_default,
	})
end

local function get_current_theme_index(theme)
	local colorschemes = theme.themes

	for i, t in ipairs(vim.tbl_values(colorschemes)) do
		if t.scheme == theme.default.scheme then
			return i
		end
	end

	return 1
end

local function attach_mappings(theme)
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local default_theme = theme.default

	local on_select = function(bufnr)
		return function()
			actions.close(bufnr)
			local selection = action_state.get_selected_entry()[1]
			local t = theme.themes[selection]
			theme.set_default(t)
			theme.set(t)
			theme.save_default()
		end
	end

	return function(prompt_bufnr)
		actions.select_default:replace(on_select(prompt_bufnr))
		actions.close:enhance({
			post = function()
				theme.set_default(default_theme)
				theme.reset()
			end,
		})
		return true
	end
end

return function()
	local theme = require("utils.theme")
	local config = require("telescope.config").values
	local previewer = create_buffer_previewer(theme)
	local index = get_current_theme_index(theme)

	-- change colorscheme on selection
	local telescope = require("telescope.pickers").new({}, {
		prompt_title = "Select",
		finder = require("telescope.finders").new_table({ results = vim.tbl_keys(theme.themes) }),
		previewer = previewer,
		results_title = "Available Themes",
		default_selection_index = index,
		sorter = config.generic_sorter({}),
		attach_mappings = attach_mappings(theme),
	})

	telescope:find()
end
