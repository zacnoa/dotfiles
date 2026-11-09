-----------------------
---- LOOK AND FEEL ----
-----------------------
-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,

		border_size = 2,

		col = {
			active_border = "rgba(0, 0, 0, 0)",
			inactive_border = "rgba(0, 0, 0, 0)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "scrolling",
	},
})
hl.config({

	decoration = {
		rounding = 8,
		rounding_power = 5,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1,
		inactive_opacity = 0.6,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = true,
			size = 2,
			passes = 2,
			vibrancy = 0.1696,
		},
	},
})
hl.config({

	animations = {
		enabled = true,
	},
})
