-- Adds tabs to alacritty via groups

hl.bind("Alt + t", function()
	notify("pressed")
	local selected_window = hl.get_active_window()
	if selected_window ~= nil and selected_window.class == "Alacritty" then
		notify(selected_window.class)
		if selected_window.group == nil then
			notify("enabling group")
			hl.dispatch(hl.dsp.group.toggle(selected_window))
			notify(selected_window.group)
		end
	end
end)
