--- THIS MUST BE THE FIRST LINE ---
require("configure_lua")
--- THIS MUST BE THE FIRST LINE ---
__DEBUG = false

hl.bind(MAINMOD .. " + SHIFT + d", function()
	__DEBUG = __DEBUG == false
	notify("DEBUG " .. (__DEBUG and "ON" or "OFF"))
end)

require("hyprland")
require("keybinds")
require("tags")
require("monitorLayout")
require("autostart")

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

require("rice")
require("windowRules")
require("rice")
require("events")

-- For Noctalia Color templates
require("noctalia").apply_theme()
require("config", true)
