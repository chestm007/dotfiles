----------------------------------------------------------------------
--- Override all globals and functions before executing the script ---
----------------------------------------------------------------------
_require = require

function notify(msg, timeout)
	hl.notification.create({
		text = msg,
		timeout = timeout or 3000,
	})
end

local _type = type
type = function(v)
	if _type(v) == "userdata" then
		local name = getmetatable(v).__name
		if type(name) == "string" then
			return name
		end
	end
	return _type(v)
end

---@type fun<K, V>(t: table<K, V?>): boolean
function all(t)
	for _, v in ipairs(t) do
		if not v then
			return false
		end
	end
	return true
end

---@type fun<K, V>(t: table<K, V?>): boolean
function any(t)
	for _, v in ipairs(t) do
		if v then
			return true
		end
	end
	return false
end

---@type fun<R>(module: string, dir?: boolean): R
require = require("utils/require")
require("globals") -- This needs to be done before anything else, incase what your doing requires one of the globals.
__HL = require("hl_extensions/hl")

__HL_PATCHED = nil ---@type boolean?

function debug(...)
	if __DEBUG then
		notify(...)
	end
end
