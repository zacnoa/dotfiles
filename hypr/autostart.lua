-------------------
---- AUTOSTART ----
-------------------
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local variables = require("variables")
local terminal = variables.terminal

hl.on("hyprland.start", function()
	hl.exec_cmd(terminal)
	hl.exec_cmd("noctalia")
	hl.exec_cmd("kando")

	hl.timer(function()
		hl.exec_cmd("kando")
	end, {timeout=500,type="oneshot"}

	)
end)
