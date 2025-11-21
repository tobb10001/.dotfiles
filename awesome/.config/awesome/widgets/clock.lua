local wibox = require("wibox")
local gears = require("gears")

widget = wibox.widget({
	widget = wibox.widget.textbox,
})

gears.timer({
	timeout = 1,
	autostart = true,
	call_now = true,
	callback = function()
		-- local uni_week = tonumber(os.date("%W")) - 32
		-- local text = os.date("%a, %d %H:%M:%S (%V, " .. uni_week .. ")")
		local text = os.date("%a, %d %H:%M:%S (%V)")
		widget.text = text
	end,
})

return widget
