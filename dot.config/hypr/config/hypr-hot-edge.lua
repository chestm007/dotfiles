-- Hot edge: slide the cursor along a screen edge to open a special
-- workspace. Configured via the plugin's Lua API (src/HotEdge.cpp).
--
-- The plugin is loaded after this file has already run once (it dlopens in
-- postConfigReload), so guard for it not being available yet. Hyprland
-- re-runs this config right after the plugin loads, which is when these
-- definitions actually get picked up.

if hl.plugin and hl.plugin.hyprhotedge and hl.plugin.hyprhotedge.add_edge then
	notify("Loaded HyprHotEdge")
	-- Gap between a corner zone and the edges it sits between (px).
	hl.plugin.hyprhotedge.set_corner_margin(10)

	hl.plugin.hyprhotedge.add_edge({
		side = "right",
		trigger_width = 15, -- px from the screen edge that arms the trigger
		dwell_time = 150, -- ms in the zone before the panel opens
		special_workspace = "HHERight",
		target_monitor = "*", -- "*" = all monitors
		hide_on_leave = true, -- close when the cursor leaves the panel
	})

	hl.plugin.hyprhotedge.add_edge({
		side = "top",
		trigger_width = 15,
		dwell_time = 150,
		special_workspace = "HHETop",
		hide_on_leave = true,
	})
end
