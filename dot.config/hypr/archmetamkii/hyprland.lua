local Table = require("utils/table")
local gamemode = require("gamemode")

local mons = Table(hl.get_monitors())
--- disable gamemode when config is loaded if we're connected via VNC
if mons:contains({
	value = "VNC-SCREEN",
	selector = function(v)
		return v.name
	end,
}) then
	hl.timer(gamemode.enable, { timeout = 200, type = "oneshot" })
end
