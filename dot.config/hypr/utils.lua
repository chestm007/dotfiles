function NOTIFY(msg)
	hl.notification.create({ text = msg, timeout = 3000 })
end

---get_exec_result
---@param command string
local function get_exec_result(command)
	local f = io.popen(command)
	if f then
		local result = f:read("*a"):gsub("%s+", "")
		f:close()
		return result
	else
		NOTIFY(command .. " returned nil")
	end
end

local function getHostname()
	return get_exec_result("uname -n"):lower()
end

local function getConfigDir()
	return get_exec_result("echo $HOME") .. "/.config/hypr"
end

local hostname = getHostname()
local configDir = getConfigDir()
NOTIFY(configDir)

---optionalRequire
--- check file presence before requiring, do nothing if the file doesnt exist
---@param modName string
local function optionalRequire(modName)
	local fileName = configDir .. "/" .. modName .. ".lua"
	local f = io.open(fileName)
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

function MUL(t, n)
	local out = {}
	for k, v in pairs(t) do
		if type(v) == "number" then
			out[k] = v * n
		else
			out[k] = v
		end
	end
	return out
end

UTILS = {
	getHostname = getHostname,
	getConfigDir = getConfigDir,
	optionalRequire = optionalRequire,
	require = requireHostSpecific,
}
