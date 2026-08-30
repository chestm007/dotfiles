-- Monitor backlight brightness
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd(COMMANDS.monitor_brightness .. " 5%+"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd(COMMANDS.monitor_brightness .. " 5%-"),
	{ locked = true, repeating = true }
)

-- Keyboard backlight brightness [Requires clevo-drivers-dkms-git from AUR]
hl.bind(
	"XF86KbdBrightnessUp",
	hl.dsp.exec_cmd(COMMANDS.keyboard_brightness .. " 5%+"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86KbdBrightnessDown",
	hl.dsp.exec_cmd(COMMANDS.keyboard_brightness .. " 5%-"),
	{ locked = true, repeating = true }
)

hl.bind(
	MAINMOD .. " + XF86AudioRaiseVolume",
	hl.dsp.exec_cmd(COMMANDS.monitor_brightness .. " 5%+"),
	{ locked = true, repeating = true }
)

hl.bind(
	MAINMOD .. " + XF86AudioLowerVolume",
	hl.dsp.exec_cmd(COMMANDS.monitor_brightness .. " 5%-"),
	{ locked = true, repeating = true }
)

-- switch out of remmina when holding ctrl and winblows
-- local function fix_fucked_remmina()
--
-- end
-- for i in range(1, 10)
-- hl.bind(MAINMOD .. " CTRL + .. i,
