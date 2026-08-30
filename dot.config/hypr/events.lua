---asdad@type fun(event: "window.open_early", cb: fun(window: HL.Window)): HL.EventSubscription
hl.on("window.open_early", function(window)
	if debug then
		local str = "Window: [class: " .. window.class
		str = str .. ", title: " .. window.title .. ", floating: " .. tostring(window.floating) .. "]"
		-- TODO: implement the thing.
		debug(str, 3000)
	end
end)

hl.on("monitor.added", function(monitor)
	--- TODO: either move workspaces manually here, or activate workspace rules as groups?
end)
