local path_util = require("utils.path")

local import = require("utils.import")

--- @param name string
--- @param parent_module_callback fun(parent_module: string): string | nil
---
return function(name, parent_module_callback)
	local result = {}

	local dir_path = path_util.use_relative_module_path(name, parent_module_callback)

	local file_paths = vim.split(vim.fn.glob(dir_path .. "/*"), "\n")

	vim.tbl_map(function(file_path)
		if file_path == "" then
			return
		end

		local module = path_util.to_module(file_path)

		result[module] = import(function(_)
			return module
		end)
	end, file_paths)

	return result
end
