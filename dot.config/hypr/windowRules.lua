hl.window_rule({
  match = {
    class = "gitkraken"
  },
  float = 0,
  workspace = 9
})

hl.window_rule({
    match = {
        class = "slack|Caprine|Spotify"
    },
    float = 0,
    workspace = 2
})

-- Ignore maximize requests from all apps. You'll probably like this.
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

--------------------------
-- Jetbrains Annoyances --
--------------------------
-- stop Open Project windows from being tiled
hl.window_rule({
    name = "jetbrains-open-project-floating",
    match = {
        class = "jetbrains-.*",
        title = "Open Project|Conflicting Plugins"
    },
    float = true,
    no_focus = false
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_initial_focus = true,
})

-- stop jetbrains popups from being all fucked.
hl.window_rule({
    name = "jetbrains-unfucker",
    match = {
        class = "jetbrains-.*",
        float = true
    },
    --no_focus = true,
    no_anim = true,
    decorate = false,
    rounding_power = 1,
    rounding = 0,
    opacity = "1.0 override"
})


-- Old Legacy code from hyprlang that hasnt been ported to lua yet.

--windowrule = no_anim = true, match:workspace = 3
--windowrule = no_initial_focus on, match:xwayland true  # https://wiki.archlinux.org/title/Hyprland#Jetbrains_apps_focus_issues
