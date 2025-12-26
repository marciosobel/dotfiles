local map = vim.keymap.set
local noremap = function(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.noremap = true
	map(mode, lhs, rhs, opts)
end

local map_table = function(map_table, fn)
	if not map_table then
		return
	end

	for _, mapping in ipairs(map_table) do
		---@diagnostic disable-next-line: deprecated
		fn(unpack(mapping))
	end
end

local handle_mappings_table = function(mappings_table)
	map_table(mappings_table.noremap, noremap)
	map_table(mappings_table.map, map)
end

local files = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/config/mappings")

for _, file in ipairs(files) do
	if string.sub(file, -4) == ".lua" and file ~= "init.lua" then
		local mappings_table = require("config.mappings." .. string.sub(file, 1, -5)) or {}
		handle_mappings_table(mappings_table)
	end
end
