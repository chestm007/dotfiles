---get_exec_result
---@param command string
---@return string?
local function get_exec_result(command)
	local f = io.popen(command)
	if f then
		local result = f:read("*a"):gsub("%s+", "")
		f:close()
		return result
	else
		notify(command .. " returned nil")
	end
end

return {
	hostname = get_exec_result("uname -n"):lower(),
	config_dir = get_exec_result("echo $HOME") .. "/.config/hypr",
}
