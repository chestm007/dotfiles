-- declare all global variables here, think of this as .env for docker-compose
MAINMOD = "SUPER" -- Sets "Windows" key as main modifier

--- Programs
TERMINAL = "alacritty"
--fileManager   = "dolphin"
FILEMANAGER = "nautilus" -- gnome file browser
MENU = "hyprlauncher"

-- custom Hyprland variables
WINDOW_RESIZE_INCREMENT = 20

COMMANDS = {
	keyboardBrightness = "",
	volume = {
		up = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ ",
		down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ ",
		mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ",
		muteMic = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ ",
	},
}

