-- Adds tabs to alacritty via groups

hl.bind("ALT + t", function()
	local selected_window = hl.get_active_window()
	if selected_window ~= nil and selected_window.class == "Alacritty" then
		if selected_window.group == nil then
			hl.dispatch(hl.dsp.group.toggle(selected_window))
		else
			hl.dispatch(hl.dsp.group.toggle(selected_window))
		end
	end
end)
