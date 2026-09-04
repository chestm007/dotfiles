-------------------
---- AUTOSTART ----
-------------------
-- STOP TURNING THESE OFF, THEY ARENT WHY YOUR SHIT WONT LOAD!

hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start noctalia") -- make pretty shell n shit
	hl.exec_cmd("systemctl --user start hyprlauncher") -- preload hyprlauncher so its fast when i actually want it
	hl.exec_cmd("systemctl --user start hyprpolkitagent") -- GUIauth popups n shit
end)

-- so far not needed.
-- exec-once = gnome-keyring-daemon --start --components=pkcs11,secrets,ssh
