local debug = false

hl.bind(MAINMOD .. " + SHIFT + d", function()
	if debug then
		NOTIFY("DEBUG OFF")
		debug = false
	else
		NOTIFY("DEBUG ON")
		debug = true
	end
end)

hl.on("window.open_early", function(window)
	if debug then
		hl.notification.create({ text = tostring(window.floating), timeout = 3000 })
	end
end)

hl.on("monitor.added", function(monitor) end)
