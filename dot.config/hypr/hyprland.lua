require("utils")
local hostname = UTILS.getHostname()

UTILS.require("globals") -- This needs to be done before anything else, incase what your doing requires one of the globals.
UTILS.require("keybinds")
UTILS.optionalRequire(hostname .. "/tags")
UTILS.require("monitorLayout")
UTILS.require("autostart")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("IDEA_JDK", "/usr/lib/jvm/jre-jetbrains")
hl.env("PHPSTORM_JDK", "/usr/lib/jvm/jre-jetbrains")
hl.env("WEBIDE_JDK", "/usr/lib/jvm/jre-jetbrains")
hl.env("PYCHARM_JDK", "/usr/lib/jvm/jre-jetbrains")
hl.env("RUBYMINE_JDK", "/usr/lib/jvm/jre-jetbrains")
hl.env("CL_JDK", "/usr/lib/jvm/jre-jetbrains")
hl.env("DATAGRIP_JDK", "/usr/lib/jvm/jre-jetbrains")
hl.env("GOLAND_JDK", "/usr/lib/jvm/jre-jetbrains")
hl.env("STUDIO_JDK", "/usr/lib/jvm/jre-jetbrains")
hl.env("RUSTROVER_JDK", "/usr/lib/jvm/jre-jetbrains")

-- for libadwaita gtk4 apps you can use this command:
hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'") -- for GTK4 apps

-- for gtk3 apps you need to install adw-gtk3 theme (in arch linux sudo pacman -S adw-gtk-theme)
hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'") -- for GTK3 apps

hl.env("QT_QPA_PLATFORMTHEME", "hyprqt6engine")

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

-- 3 finger swipe left/right to change workspace
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.gesture({
	fingers = 3,
	direction = "vertical",
	action = "special",
})

hl.config({
	group = {
		auto_group = true,
		groupbar = {
			enabled = true,
		},
	},
})

UTILS.require("rice")
UTILS.require("windowRules")
UTILS.require("rice")
UTILS.require("events")
UTILS.require("alacritty")
UTILS.require("workspaceMappings")

UTILS.optionalRequire(hostname .. "/remmina")
