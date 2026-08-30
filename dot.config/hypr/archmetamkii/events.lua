local brightness = COMMANDS.monitor_brightness_get()

hl.on(
	"monitor.added",
	---@param monitor HL.Monitor
	function(monitor)
		if monitor.name ~= "eDP-1" or monitor.name ~= "eDP-2" then
			brightness = COMMANDS.monitor_brightness_get()
			hl.exec_cmd(COMMANDS.monitor_brightness .. "0%")
			notify("VNC Detected", 10000)
		end
	end
)

hl.on(
	"monitor.removed",
	---@param monitor HL.Monitor
	function(monitor)
		hl.exec_cmd(COMMANDS.monitor_brightness .. brightness)
		notify("VNC Stopped")
	end
)
