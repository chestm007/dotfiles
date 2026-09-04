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
		if window.size.y > 41 and false then
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
