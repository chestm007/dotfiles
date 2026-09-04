local ProxyBase = require("utils/proxy_class")
local Table = _require("utils.table")

---@class Monitor: HL.Monitor
---@field __userdata userdata
local Monitor = {}

function Monitor:bounds()
	return Table({
		left = self.x,
		right = self.x + self.width,
		top = self.y,
		bottom = self.y + self.height,
	})
end

return ProxyBase(Monitor)
