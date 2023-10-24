local vc = require('vicious')
local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local gfs = require("gears.filesystem")
local icon = gfs.get_configuration_dir() .. '/icons/crayon/calendar.png'
local color = gfs.get_configuration_dir() .. '/theme/.palette'
local beautiful = require('beautiful')
local calendar_widget = require('awesome-wm-widgets.calendar-widget.calendar')

-- Crear el widget de fecha
local date_text = wibox.widget.textbox()
vc.register(date_text, vc.widgets.date, ' %b %d %I:%M')

-- Crear el widget de imagen
local date_icon = wibox.widget.imagebox(icon)

local date_combined = wibox.layout.fixed.horizontal()
date_combined:add(date_icon)
date_combined:add(date_text)

local date = date_combined

local cw = calendar_widget({
	placement = 'top_right',
	start_sunday = true,
	radius = 8,
	previous_month_button = 1,
	next_month_button = 3,
})
--[[
local date = awful.popup {
	widget = {
		{
			icon = date_icon,
			text = date_text
		},
		{
			{
				text = 'jss',
				widget = cw
			}
		}
	}
}]]

date:connect_signal('button::press',
	function(_, _, _, button)
		if button == 1 then cw.toggle() end
	end
)

return date
