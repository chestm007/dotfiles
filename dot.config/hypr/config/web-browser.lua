hl.window_rule({
	name = "youtube-pip",
	match = {
		title = "Picture in Picture",
	},
	float = true,
})

-- vivaldi settings
hl.window_rule({
	name = "vivaldi-settings-float",
	match = {
		class = "vivaldi-stable",
		title = "Vivaldi Settings: .*?",
	},
	float = true,
})
