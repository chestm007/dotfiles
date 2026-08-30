-------------------
---- AUTOSTART ----
-------------------
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
-- STOP TURNING THESE OFF, THEY ARENT WHY YOUR SHIT WONT LOAD!

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprlauncher -d") -- preload hyprlauncher so its fast when i actually want it
	hl.exec_cmd("systemctl --user start hyprpolkitagent") -- GUIauth popups n shit
end)

-- so far not needed.
-- exec-once = gnome-keyring-daemon --start --components=pkcs11,secrets,ssh
