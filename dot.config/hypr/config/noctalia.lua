-- allow easily identifiable windows to float
hl.window_rule({
	name = "floating-windows",
	match = {
		class = "dev.noctalia.*",
	},
	float = true,
})
