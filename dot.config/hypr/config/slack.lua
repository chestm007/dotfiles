hl.window_rule({
	match = {

		-- | actual slack window  |
		-- class: slack
		-- title: office-hangs (Channel) - Zepben - 3 new items - Slack
		-- initialClass: slack
		-- initialTitle: Slack

		class = "slack|Caprine|Spotify",
		-- when waiting
		-- title: title: - Zepben - Slack
		-- initialTitle: Slack - Huddle Preview

		-- | after connecting |
		-- class: slack
		-- title: office-hangs - Zepben - Slack
		-- initialClass: slack
		-- initialTitle: Slack - Huddle Preview
		-- inhibitingIdle: 1
	},
	float = false,
	workspace = 2,
})

hl.window_rule({
	match = {
		class = "slack",
		title = "Slack - Huddle Preview",
	},
	float = true,
})
