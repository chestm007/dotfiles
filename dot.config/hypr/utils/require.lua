require("utils/string")
local _require = require
local utils = require("utils")

--- check file presence before requiring, do nothing if the file doesnt exist
---@type fun<R>(module: string): R?
local function optional_require(module)
	local fileName = utils.config_dir .. "/" .. module .. ".lua"
	local f = io.open(fileName)
	-- if file is present, f will not be nil
	if f then
		f:close()
		return _require(module)
	end
end

--- fetches `modName` from the `hostname` subdirectory
---@type fun<R>(module: string): R?
local function require_host_specific(module)
	local _module = utils.hostname .. "/" .. module
	return optional_require(_module)
end

---@type fun<R>(module: string): table<string, R>
local function require_directory(module)
	local directory = utils.config_dir .. "/" .. module
	local results = {}
	for filename in io.popen("ls " .. directory):lines() do
		local file = filename:replace(".lua", "")
		results[file] = require(module .. "/" .. file:replace(".lua", ""))
	end
	return results
end

---@type fun<R>(module: string, dir?: boolean): R
return function(module, dir)
	if dir then
		return require_directory(module)
	else
		local required
		-- check before requiring file
		if module ~= "hyprland" then
			required = optional_require(module)
		end
		-- check in ./<hostname>/module
		local host = require_host_specific(module)
		if required ~= nil or host ~= nil then
			return required, host
		end
		notify("nothing returned from importing: " .. module, 5000)
		return nil, nil
	end
end
