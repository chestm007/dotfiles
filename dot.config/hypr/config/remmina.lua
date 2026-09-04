hl.window_rule({
	name = "lock-remmina-fullscreen",
	match = {
		class = "org.remmina.Remmina",
		title = "laptop",
	},
	fullscreen = true,
	fullscreen_state = 2,
	suppress_event = "fullscreen",
})

-- completely stops remmina from being able to de-fullscreen itself
hl.on("window.fullscreen", function(window)
	if window.class == "org.remmina.Remmina" and window.title == "laptop" then
		if window.fullscreen ~= 2 then
			hl.dispatch(hl.dsp.window.fullscreen(window.__userdata))
		end
	end
end)

hl.bind(MAINMOD .. " + C", function()
	notify("yes")
end)
