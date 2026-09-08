-- GAMEMODE
--
local gamemode = {
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

hl.bind("SUPER + F1", function()
	local game_mode = (hl.get_config("animations.enabled") == false)

	if game_mode then
		hl.exec_cmd("hyprctl reload")
		return
	end

	gamemode.enable()
end)

return gamemode
