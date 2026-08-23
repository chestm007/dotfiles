local brightness = commands.monitorBrightnessGet()

hl.on(
	"monitor.added",
	---@param monitor HL.Monitor
	function(monitor)
		if monitor.name ~= "eDP-1" or monitor.name ~= "eDP-2" then
			brightness = commands.monitorBrightnessGet()
			hl.exec_cmd(commands.monitorBrightness .. "10%")
			notify(monitor.name)
		end
	end
)

hl.on(
	"monitor.removed",
	---@param monitor HL.Monitor
	function(monitor)
		hl.exec_cmd(commands.monitorBrightness .. brightness)
		notify("fuck off")
	end
)
