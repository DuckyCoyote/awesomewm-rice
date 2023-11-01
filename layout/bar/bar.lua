local dpi = require('beautiful.xresources').apply_dpi
local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local gfs = require("gears.filesystem")
local current_config = gfs.get_configuration_dir()

-- Widgets
local date = require('widgets/.clock')
local mem = require('widgets/.mem')
local wifi = require('widgets/.wifi')
local weather = require('widgets/.weather')
local hdd = require('widgets/.hdd')
local cpu = require('widgets/.cpu')
local weather_widget = require("awesome-wm-widgets.weather-widget.weather")
local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")
local dashboard = require('widgets/.dashboard')
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')
local fs_widget = require('awesome-wm-widgets.fs-widget.fs-widget')
local bat = require('widgets.battery')
local taglist = require('layout/bar/.taglist')

-- Functions
local add_margin = require('layout/.add-margin')
local baritems = require('layout/bar/.baritems')

awful.screen.connect_for_each_screen(function(s)
	-- Each scre en has its own tag table.
	awful.tag({ "1", "2", "3", "4", "5" }, s, awful.layout.layouts[1])

	baritems(s)

	s.mytaglist = taglist(s)

	function rounded_shape(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 15)
	end

	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = 40,
		width = s.full,
		border_width = 7,
		shape = rounded_shape
	})

	s.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{ -- Left Items
			add_margin(dashboard, 7),
			add_margin(s.mytaglist, 7),
			add_margin(s.mytasklist, 7),
			layout = wibox.layout.align.horizontal,
		},
		{ -- Middle Items
			layout = wibox.layout.align.horizontal,
			add_margin(s.mypromptbox, 3)
		},
		{ -- Right Items			
			add_margin(spotify_widget({
				font = 'Cascadia Code 11',
				play_icon = gfs.get_configuration_dir() .. '/icons/play.png',
				pause_icon = gfs.get_configuration_dir() .. '/icons/pause-button.png'
			}), 12),
			add_margin(
				weather_widget({
					api_key = '74506808e69308bd700962204ad7fecf',
					coordinates = { 19.6997, -99.1475 },
					font_name = 'Carter One',
					icons = 'VitalyGorbachev',
					icons_extension = '.svg',
					show_hourly_forecast = true,
					show_daily_forecast = true,
				}), 7),
			add_margin(wifi, 9),
			add_margin(cpu, 9),
			add_margin(hdd, 7),
			add_margin(mem, 5),
			add_margin(bat, 5),
			add_margin(date, 7),
			add_margin(volume_widget, 7),
			add_margin(s.mylayoutbox, 10),
			layout = wibox.layout.fixed.horizontal,
		},
		left = 100
	}
end)
