return {
	enable = function()
		hl.config({

			animations = {
				enabled = false, -- Disable animations
			},

			-- Disable blur, shadow and window rounding
			decoration = {
				shadow = { enabled = false },
				blur = { enabled = false },
				motion_blur = { enabled = false },
			},
		})
	end,
}
