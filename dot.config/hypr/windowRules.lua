require("utils/string")
require("utils")
local T = require("utils/table")

hl.window_rule({
	match = {
		class = "gitkraken",
	},
	float = false,
	workspace = 9,
})

hl.window_rule({
	match = {

		-- | actual slack window  |
		-- class: slack
		-- title: office-hangs (Channel) - Zepben - 3 new items - Slack
		-- initialClass: slack
		-- initialTitle: Slack

		class = "slack|Caprine|Spotify",
		-- when waiting
		-- title: title: - Zepben - Slack
		-- initialTitle: Slack - Huddle Preview

		-- | after connecting |
		-- class: slack
		-- title: office-hangs - Zepben - Slack
		-- initialClass: slack
		-- initialTitle: Slack - Huddle Preview
		-- inhibitingIdle: 1
	},
	float = false,
	workspace = 2,
})

hl.window_rule({
	match = {
		class = "slack",
		title = "Slack - Huddle Preview",
	},
	float = true,
})

-- Steam
hl.window_rule({
	match = {
		class = "steam",
		title = "Steam Settings",
	},
	float = true,
})

-- Ignore maximize requests from all apps. You'll probably like this.
hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

-- allow easily identifiable windows to float
hl.window_rule({
	name = "floating-windows",
	match = {
		class = "dev.noctalia.*",
	},
	float = true,
})

-- vivaldi settings
hl.window_rule({
	name = "vivaldi-settings-float",
	match = {
		class = "vivaldi-stable",
		title = "Vivaldi Settings: .*?",
	},
	float = true,
})

--------------------------
-- Jetbrains Annoyances --
--------------------------
-- stop Open Project windows from being tiled
hl.window_rule({
	name = "jetbrains-open-project-floating",
	match = {
		class = "jetbrains-.*",
		title = "Open Project|Conflicting Plugins",
	},
	float = true,
	no_focus = false,
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_initial_focus = true,
})

-- stop jetbrains popups from being all fucked.
hl.window_rule({
	name = "jetbrains-unfucker",
	match = {
		class = "jetbrains-.*",
		float = true,
	},
	--no_focus = true,
	no_anim = true,
	decorate = false,
	rounding_power = 1,
	rounding = 0,
	opacity = "1.0 override",
})

hl.on("window.open", function(window)
	if window.class:startswith("jetbrains-") then
		if window.size.y > 41 then
			-- resize to stop the wierd stretchy thing.
			hl.timer(function()
				hl.dispatch(hl.dsp.window.resize({
					x = window.size.x + 1,
					y = window.size.y,
					window = window.__userdata,
				}))
			end, { timeout = 100, type = "oneshot" })
			debug(type(window.__userdata))
			local cur_monitor = hl.get_monitor_at_cursor()
			local monitor_bounds = T({
				left = cur_monitor.x,
				right = cur_monitor.x + cur_monitor.width,
				top = cur_monitor.y + cur_monitor.height,
				bottom = cur_monitor.y,
			})

			local cursor_pos = hl.get_cursor_pos()
			local window_centre = T(window.size):mul(0.5)
			local new_window_pos = T(cursor_pos):sub(window_centre):ensure_in_bounds(monitor_bounds)

			debug(
				"MONITOR:: "
					.. monitor_bounds.left
					.. " || "
					.. monitor_bounds.right
					.. " || "
					.. monitor_bounds.top
					.. " || "
					.. monitor_bounds.bottom,
				10000
			)
			debug("CURSOR:: " .. cursor_pos.x .. " || " .. cursor_pos.y, 10000)

			hl.dispatch(hl.dsp.window.move({ x = new_window_pos.x, y = new_window_pos.y, window = window.__userdata }))
			hl.dispatch(hl.dsp.focus({ window = window.__userdata }))
		else
			debug("must be a JB Tab")
		end
	else
	end
end)

-- PCSX2
hl.window_rule({
	name = "pcsx2-settings",
	match = {
		class = "pcsx2-qt",
		title = "PCSX2 Settings",
	},
	float = 1,
})
