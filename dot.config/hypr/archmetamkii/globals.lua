---getMonitorBrightnessDevice
---as the device can change between reboots, we do sum hax
---possible values:
---  amdgpu_bl1
---  amdgpu_bl2
local function getMonitorBrightnessDevice()
	local f = io.popen("brightnessctl -l | grep \"'backlight'\" | cut -d ' ' -f 2")
	local line = f:read("*a"):gsub("%s+", "")
	f:close()
	return line
end
local monitorBrightnessDevice = getMonitorBrightnessDevice()

local function getMonitorBrightness()
	local monitorBrightnessGet = "brightnessctl -d " .. monitorBrightnessDevice .. " get "
	local f = io.popen(monitorBrightnessGet)
	local line = f:read("*a"):gsub("%s+", "")
	f:close()
	return line
end

commands.keyboardBrightness = "brightnessctl -d rgb:kbd_backlight set "
commands.monitorBrightness = "brightnessctl -d " .. monitorBrightnessDevice .. " set "
commands.monitorBrightnessGet = getMonitorBrightness

laptopScreenOutputName = "eDP-1"
vncHeadlessOutputName = "VNC-SCREEN"
rearHdmiOutputName = "HDMI-A-1"

-- Office Configuration
centreDellScreenOutputName = "DP-10"
portraitSamsungScreenOutputName = "DP-9"
-- End Office Configuration
