local function toggle_telescope(harpoon_files)
	local telescope_config = require("telescope.config").values
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	local telescope = require("telescope.pickers").new({}, {
		prompt_title = "Harpoon",
		finder = require("telescope.finders").new_table({ results = file_paths }),
		previewer = telescope_config.file_previewer({}),
		sorter = telescope_config.generic_sorter({}),
	})

	telescope:find()
end

local function harpoon_select(index)
	local harpoon = require("harpoon")
	harpoon:list():select(index)
end

return {
	map = {
		{
			"n",
			"<leader>ha",
			function()
				require("harpoon"):list():add()
			end,
			{ desc = "Harpoon add file" },
		},
		{
			"n",
			"<leader>hf",
			function()
				toggle_telescope(require("harpoon"):list())
			end,
			{ desc = "Harpoon toggle telescope" },
		},
		{
			"n",
			"<C-p>",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			{ desc = "Harpoon toggle quick menu" },
		},
		{
			"n",
			"<leader>1",
			function()
				harpoon_select(1)
			end,
			{ desc = "Harpoon select entry 1" },
		},
		{
			"n",
			"<leader>2",
			function()
				harpoon_select(2)
			end,
			{ desc = "Harpoon select entry 2" },
		},
		{
			"n",
			"<leader>3",
			function()
				harpoon_select(3)
			end,
			{ desc = "Harpoon select entry 3" },
		},
		{
			"n",
			"<leader>4",
			function()
				harpoon_select(4)
			end,
			{ desc = "Harpoon select entry 4" },
		},
	},
}
