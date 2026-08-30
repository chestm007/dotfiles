-- laptop screen
hl.monitor({
	output = laptop_screen_output_name,
	mode = "2560x1600@144",
	position = "0x0",
	scale = "1",
})

hl.monitor({
	output = "hypr-rdp",
	mode = "5120x1440@60",
	position = "auto",
	scale = "1",
})

hl.monitor({
	output = vnc_headless_output_name,
	mode = "5120x1440@120",
	-- mode = "2560x1440@120",
	position = "auto",
	scale = "1",
})

hl.monitor({
	output = rear_hdmi_output_name,
	mode = "5120x1440@59.98",
	position = "auto",
	scale = "1",
})

-- Home dock hdmi output - goes fucky with my super ultrawide monitor (probs HDMI limitation)
-- hl.monitor({
--   output = "DP-5",
--   --mode = "5120x1440@59.98",
--   mode = "2560x1080@10",
--   position = "auto",
--   --scale = "1",
-- })

-- centre dell screen
hl.monitor({
	output = "DP-10",
	mode = "3440x1440@144",
	position = "2560x0",
	scale = "1",
})

-- portrait samsung screen
hl.monitor({
	output = "DP-9",
	mode = "3840x2160@59.94",
	position = "6000x-1340",
	transform = 3,
	scale = "1.33",
})
