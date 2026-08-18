--########################
--### USE INTERNAL GPU ###
--########################
--hl.env("AQ_DRM_DEVICES", "/dev/dri/by-path/pci-0000:c3:00.0-card") -- NvidiaGTX5070
--hl.env("AQ_DRM_DEVICES", "/dev/dri/by-path/pci-0000:c4:00.0-card") -- onboard AMDGPU

-- Globals
commands.keyboardBrightness = "brightnessctl -d rgb:kbd_backlight set "

laptopScreenOutputName = "eDP-1"
vncHeadlessOutputName = "VNC-SCREEN"
rearHdmiOutputName = "HDMI-A-1"

    -- Office Configuration
    centreDellScreenOutputName = "DP-10"
    portraitSamsungScreenOutputName = "DP-9"
    -- End Office Configuration


-- Autostart
hl.exec_cmd("slack-wayland")
hl.exec_cmd("/home/max/drata/Drata-Agent-linux.AppImage")

-- MonitorLayout
-- laptop screen
hl.monitor({
    output = laptopScreenOutputName,
    mode = "2560x1600@144",
    position = "0x0",
    scale = "1",
})

hl.monitor({
    output = "hypr-rdp",
    mode = "5120x1440@60",
    position = "auto",
    scale = "1",
})

hl.monitor({
    output = vncHeadlessOutputName,
    mode = "5120x1440@120",
    position = "auto",
    scale = "1",
})

hl.monitor({
    output = rearHdmiOutputName,
    mode = "5120x1440@59.98",
    position = "auto",
    scale = "1",
})

-- Home dock hdmi output - goes fucky with my super ultrawide monitor (probs HDMI limitation)
-- hl.monitor({
--   output = "DP-5",
--   --mode = "5120x1440@59.98",
--   mode = "2560x1080@10",
--   position = "auto",
--   --scale = "1",
-- })

-- centre dell screen
hl.monitor({
    output = "DP-10",
    mode = "3440x1440@144",
    position = "2560x0",
    scale = "1",
})

-- portrait samsung screen
hl.monitor({
    output = "DP-9",
    mode = "3840x2160@59.94",
    position = "6000x-1340",
    transform = 3,
    scale = "1.33",
})

-- WorkspaceMappings
---------------------------------
-- Bind Workspaces to Monitors --
---------------------------------
hl.workspace_rule({ workspace = 1, monitor = "DP-10"})
hl.workspace_rule({ workspace = 2, monitor = "DP-9"})
hl.workspace_rule({ workspace = 3, monitor = "DP-10"})
hl.workspace_rule({ workspace = 4, monitor = "DP-10"})
hl.workspace_rule({ workspace = 5, monitor = "DP-10"})
hl.workspace_rule({ workspace = 6, monitor = "DP-10"})
hl.workspace_rule({ workspace = 7, monitor = "DP-10"})
hl.workspace_rule({ workspace = 8, monitor = "DP-10"})
hl.workspace_rule({ workspace = 9, monitor = "DP-10"})
hl.workspace_rule({ workspace = 0, monitor = "DP-10"})

--------------------------------
-- Bind Windows to Workspaces --
--------------------------------
hl.window_rule({
    match = {
        class = "Opera|vivaldi-stable"
    },
    float = 0,
    workspace = 1
})

hl.window_rule({
    match = {
        class = "slack|Caprine|Spotify"
    },
    float = 0,
    workspace = 2
})

hl.window_rule({
    match = {
        class = "jetbrains-pycharm"
    },
    workspace = 3
})

hl.window_rule({
    match = {
        class = "gitkraken"
    },
    float = 0,
    workspace = 9
})
