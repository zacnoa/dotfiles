
---------------------
----   LAYOUTS   ----
---------------------

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	binds = {
		movefocus_cycles_fullscreen = true,
	},
	scrolling = {
		fullscreen_on_one_column = true,
		column_width = 0.5,
		follow_focus = true,
		focus_fit_method = 1,
	},
})
