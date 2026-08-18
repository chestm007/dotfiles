---------------------
---- KEYBINDINGS ----
---------------------

----------------------
-- GLOBAL VARIABLES --
----------------------
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

--------------
-- KEYBINDS --
--------------

-- Global Binds
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))  -- Terminal
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager)) -- File Browser
hl.bind(mainMod .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd('grim -g "`slurp`" - | wl-copy'))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move window with mainMod + arrow keys
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left", follow = false }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right", follow = false }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up", follow = false }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down", follow = false }))

local workspaceMoveMod = mainMod .. " + CTRL + SHIFT"
-- Move workspace to other monitor
hl.bind(workspaceMoveMod .. " + left", hl.dsp.workspace.move({ monitor="+1" }) )
hl.bind(workspaceMoveMod .. " + right", hl.dsp.workspace.move({ monitor="-1" }) )

-- Switch to a submap called `resize`.
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))

-- Start a submap called "resize".
hl.define_submap("resize", function()

    -- Set repeating binds for resizing the active window.
    hl.bind("right", hl.dsp.window.resize({ x = windowResizeIncrement, y = 0, relative = true}), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = windowResizeIncrement * -1, y = 0, relative = true}), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = windowResizeIncrement, relative = true}), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = windowResizeIncrement * -1, relative = true}), { repeating = true })

    -- Use `reset` to go back to the global submap
    hl.bind("escape", hl.dsp.submap("reset"))

end)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


------------------------------------------------------------
-- Keybinds that really should have just been autodetected --
------------------------------------------------------------

-- Laptop multimedia keys for volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
-- Monitor backlight brightness
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -d amdgpu_bl1 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -d amdgpu_bl1 set 5%-"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -d amdgpu_bl2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -d amdgpu_bl2 set 5%-"),                  { locked = true, repeating = true })
-- Keyboard backlight brightness [Requires clevo-drivers-dkms-git from AUR]
hl.bind("XF86KbdBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -d rgb:kbd_backlight set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86KbdBrightnessDown",hl.dsp.exec_cmd("brightnessctl -d rgb:kbd_backlight set 5%-"),                  { locked = true, repeating = true })
-- Multimedia keys [Requires playerctl]
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- GAMEMODE
hl.bind("SUPER + F1", function ()
    local game_mode = (hl.get_config("animations.enabled") == false)

    if game_mode then
        hl.exec_cmd("hyprctl reload")
        return
    end
    
    hl.config({
        general = {
            border_size = 0,
        },

        animations = {
            enabled = false, -- Disable animations
        },
        
        -- Disable blur, shadow and window rounding
        decoration = {
            shadow = { enabled = false },
            blur = { enabled = false },
            rounding = 0,
        }
    })
end)
