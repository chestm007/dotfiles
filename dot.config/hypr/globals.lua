-- declare all global variables here, think of this as .env for docker-compose

myConfig = {}
function myConfig.getHostname()
    local f = io.popen ("/bin/hostname")
    local hostname = f:read("*a") or ""
    f:close()
    hostname = string.gsub(hostname, "\n$", "")
    return hostname
end
myConfig.hostname = myConfig.getHostname()

--- Programs
terminal        = "alacritty"
--fileManager   = "dolphin"
fileManager     = "nautilus" -- gnome file browser
menu            = "hyprlauncher"


-- custom Hyprland variables
windowResizeIncrement = 20

commands = {
    monitorBrightness = "brightnessctl -d amdgpu_bl1 set ",
    keyboardBrightness,
    volume = {
        up = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ ",
        down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ ",
        mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ",
        muteMic = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ "
    }
}

require(myConfig.hostname.lower())