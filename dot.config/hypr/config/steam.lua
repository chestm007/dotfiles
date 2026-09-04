-- Steam
hl.window_rule({
	match = {
		class = "steam",
		title = "Steam Settings",
	},
	float = true,
})

hl.window_rule({
	match = {
		class = "steam_app_default",
	},
	float = 0,
	workspace = 0,
})
