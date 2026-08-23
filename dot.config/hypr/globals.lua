-- declare all global variables here, think of this as .env for docker-compose
mainMod = "SUPER" -- Sets "Windows" key as main modifier

--- Programs
terminal = "alacritty"
--fileManager   = "dolphin"
fileManager = "nautilus" -- gnome file browser
menu = "hyprlauncher"

-- custom Hyprland variables
windowResizeIncrement = 20

commands = {
	keyboardBrightness = "",
	volume = {
		up = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ ",
		down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ ",
		mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ",
		muteMic = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ ",
	},
}

function notify(msg)
	hl.notification.create({ text = msg, timeout = 3000 })
end
