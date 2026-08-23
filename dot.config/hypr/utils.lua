local function getHostname()
	local f = io.popen("uname -n")
	local hostname = f:read("*a"):gsub("%s+", "")
	f:close()
	return hostname:lower()
end

local function getConfigDir()
	local f = io.popen("echo $HOME")
	local configDir = f:read("*a"):gsub("%s+", "")
	f:close()
	return configDir .. "/.config/hypr"
end

local hostname = getHostname()
local configDir = getConfigDir()

---optionalRequire
--- check file presence before requiring, do nothing if the file doesnt exist
---@param modName string
local function optionalRequire(modName)
	local fileName = configDir .. "/" .. modName .. ".lua"
	f = io.open(fileName)
	-- if file is present, f will not be nil
	if f then
		f:close()
		require(modName)
	end
end
---requireHostSpecific
--- fetches `modName` from the `hostname` subdirectory
---@param modName string
local function requireHostSpecific(modName)
	require(modName)
	local hostSpecificConfig = hostname .. "/" .. modName
	optionalRequire(hostSpecificConfig)
end

utils = {
	getHostname = getHostname,
	getConfigDir = getConfigDir,
	optionalRequire = optionalRequire,
	require = requireHostSpecific,
}
