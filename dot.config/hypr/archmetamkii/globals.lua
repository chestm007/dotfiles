---getMonitorBrightnessDevice
---as the device can change between reboots, we do sum hax
---possible values:
---  amdgpu_bl1
---  amdgpu_bl2
local function get_monitor_brightness_device()
	local f = io.popen("brightnessctl -l | grep \"'backlight'\" | cut -d ' ' -f 2")
	local line = f:read("*a"):gsub("%s+", "")
	f:close()
	return line
end
local monitor_brightness_device = get_monitor_brightness_device()

local function get_monitor_brightness()
	local monitor_brightness_get = "brightnessctl -d " .. monitor_brightness_device .. " get "
	local f = io.popen(monitor_brightness_get)
	local line = f:read("*a"):gsub("%s+", "")
	f:close()
	return line
end

COMMANDS.keyboard_brightness = "brightnessctl -d rgb:kbd_backlight set "
COMMANDS.monitor_brightness = "brightnessctl -d " .. monitor_brightness_device .. " set "
COMMANDS.monitor_brightness_get = get_monitor_brightness

laptop_screen_output_name = "eDP-1"
vnc_headless_output_name = "VNC-SCREEN"
rear_hdmi_output_name = "HDMI-A-1"

-- Office Configuration
centre_dell_screen_output_name = "DP-10"
portrait_samsung_screen_output_name = "DP-9"
-- End Office Configuration
