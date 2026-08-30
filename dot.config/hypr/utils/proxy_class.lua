---@diagnostic disable: unused-function
---@diagnostic disable: unused-local

--[[
--Bare minimum child class implementation
local ProxyBase = require("utils/proxy_class")

@class MonitorX: HL.Monitor
@field __userdata userdata
local MonitorX = {}

return ProxyBase(MonitorX)

--then use the class as so
local MonitorX = require("file_above")
local _mon = hl.get_monitors()[1]

local mon = MonitorX(_mon)

--]]

---@generic T
---@param Class T
---@return MetaTableCreator<T>
local function create_proxy_metatable(Class)
	---@class MetaTableCreator<T>
	return {

		__index = function(self, key)
			local v = rawget(self, key)
			if v ~= nil then
				return v
			end

			v = rawget(Class, key)
			if v ~= nil then
				return v
			end

			local ud = rawget(self, "__userdata")
			if ud ~= nil then
				v = ud[key]
				if type(v) == "function" then
					return function(_, ...)
						return v(ud, ...)
					end
				end
				return v
			end
		end,

		__eq = function(a, b)
			return rawget(a, "__userdata") == rawget(b, "__userdata")
		end,
	}
end

---@generic T
---@param Class T
---@return ProxyBase<T>
local function create_proxy_class_constructor(Class)
	local mt = create_proxy_metatable(Class)
	---@class ProxyBase<T>
	---@field __userdata userdata
	return setmetatable({}, {
		---@param monitor userdata
		__call = function(_, monitor)
			local t = {}
			setmetatable(t, mt)
			t.__userdata = monitor
			return t
		end,
	})
end

return create_proxy_class_constructor
