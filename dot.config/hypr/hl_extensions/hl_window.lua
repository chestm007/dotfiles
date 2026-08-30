local ProxyBase = require("utils/proxy_class")

---@class Window: HL.Window
---@field __userdata userdata
---@field ensure_on_monitor fun(self: Window, monitor: HL.Monitor): any
local Window = {}

function Window:ensure_on_monitor(monitor)
	return monitor
end

return ProxyBase(Window)
