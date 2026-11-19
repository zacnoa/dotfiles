-------------------
---- AUTOSTART ----
-------------------
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local variables = require("variables")
local terminal = variables.terminal

hl.on("hyprland.start", function()
	hl.exec_cmd(terminal)
	hl.exec_cmd("noctalia")
end)
