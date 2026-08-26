---------------------
---- KEYBINDINGS ----
---------------------

-- Global Binds
hl.bind(MAINMOD .. " + T", hl.dsp.exec_cmd(TERMINAL)) -- Terminal
hl.bind(MAINMOD .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(MAINMOD .. " + SHIFT + K", hl.dsp.window.kill())
hl.bind(
	MAINMOD .. " + SHIFT + E",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(MAINMOD .. " + F", hl.dsp.exec_cmd(FILEMANAGER)) -- File Browser
hl.bind(MAINMOD .. " + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MAINMOD .. " + RETURN", hl.dsp.exec_cmd(MENU))
hl.bind(MAINMOD .. " + P", hl.dsp.window.pseudo())
hl.bind(MAINMOD .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(MAINMOD .. " + Print", hl.dsp.exec_cmd('grim -g "`slurp`" - | wl-copy'))
hl.bind(MAINMOD .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

for _, direction in ipairs({ "left", "right", "down", "up" }) do
	-- Move focus with mainMod + arrow keys
	hl.bind(MAINMOD .. " + " .. direction, hl.dsp.focus({ direction = direction }))
	-- Move window with mainMod + arrow keys
	hl.bind(MAINMOD .. " + SHIFT + " .. direction, hl.dsp.window.move({ direction = direction, follow = false }))
end

-- Move workspace to other monitor
for direction, modifier in pairs({ left = "+1", right = "-1" }) do
	hl.bind(MAINMOD .. " + CTRL + SHIFT + " .. direction, hl.dsp.workspace.move({ monitor = modifier }))
end

-- Switch to a submap called `resize`.
hl.bind(MAINMOD .. " + R", hl.dsp.submap("resize"))
hl.bind(MAINMOD .. " + SHIFT + R", function()
	hl.exec_cmd("hyprctl reload")
end)

-- Tabbed windows
hl.bind(MAINMOD .. " + G", hl.dsp.group.toggle())
hl.bind(MAINMOD .. " + TAB", hl.dsp.group.next())
hl.bind(MAINMOD .. " + SHIFT + TAB", hl.dsp.group.prev())

local function resize(multiplier, relative)
	if relative == nil then
		relative = true
	end
	if multiplier.x == nil then
		multiplier.x = 0
	end
	if multiplier.y == nil then
		multiplier.y = 0
	end
	return { x = multiplier.x, y = multiplier.y, relative = relative }
end
-- Start a submap called "resize".
hl.define_submap("resize", function()
	for direction, multiplier in pairs({
		right = resize({ x = 1 }),
		left = resize({ x = -1 }),
		down = resize({ y = 1 }),
		up = resize({ y = -1 }),
	}) do
		-- Set repeating binds for resizing the active window.
		hl.bind(direction, hl.dsp.window.resize(MUL(multiplier, WINDOW_RESIZE_INCREMENT)), { repeating = true })
		-- Set repeating binds for resizing the active window (large increments).
		hl.bind(
			"SHIFT + " .. direction,
			hl.dsp.window.resize(MUL(multiplier, WINDOW_RESIZE_INCREMENT * 10)),
			{ repeating = true }
		)
	end

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(MAINMOD .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(MAINMOD .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Example special workspace (scratchpad)
hl.bind(MAINMOD .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MAINMOD .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(MAINMOD .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MAINMOD .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(MAINMOD .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MAINMOD .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

------------------------------------------------------------
-- Keybinds that really should have just been autodetected --
------------------------------------------------------------

-- Laptop multimedia keys for volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(COMMANDS.volume.up .. " 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(COMMANDS.volume.down .. " 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(COMMANDS.volume.mute .. " toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(COMMANDS.volume.muteMic .. " toggle"), { locked = true, repeating = true })
-- Multimedia keys [Requires playerctl]
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- GAMEMODE
hl.bind("SUPER + F1", function()
	local game_mode = (hl.get_config("animations.enabled") == false)

	if game_mode then
		hl.exec_cmd("hyprctl reload")
		return
	end

	hl.config({

		animations = {
			enabled = false, -- Disable animations
		},

		-- Disable blur, shadow and window rounding
		decoration = {
			shadow = { enabled = false },
			blur = { enabled = false },
			motion_blur = { enabled = false },
		},
	})
end)
