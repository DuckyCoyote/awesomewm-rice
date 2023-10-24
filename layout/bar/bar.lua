local dpi = require('beautiful.xresources').apply_dpi
local wibox = require('wibox')
local awful = require('awful')
local gears = require('gears')
local gfs = require("gears.filesystem")
local current_config = gfs.get_configuration_dir()

local color = require('theme/.palette')

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
local add_margin = require('layout/.add-margin')
local pacman_icon = current_config .. "/icons/pacman.png"
local empty1_icon = current_config .. "/icons/empty.png"
local ghost_icon = current_config .. "/icons/ghost.png"


awful.screen.connect_for_each_screen(function(s)
	-- Each screen has its own tag table.
	awful.tag({ "󰪥 ", "󰪥 ", "󰪥 ", "󰪥 ", "󰪥 " }, s, awful.layout.layouts[1])

	local get_taglist = function(s)
		-- Taglist buttons
		local taglist_buttons = gears.table.join(
			awful.button({}, 1,
				function(t) t:view_only() end),
			awful.button({ modkey }, 1, function(t)
				if client.focus then client.focus:move_to_tag(t) end
			end), awful.button({}, 3, awful.tag.viewtoggle),
			awful.button({ modkey }, 3, function(t)
				if client.focus then client.focus:toggle_tag(t) end
			end), awful.button({}, 4, function(t)
				awful.tag.viewnext(t.screen)
			end), awful.button({}, 5, function(t)
				awful.tag.viewprev(t.screen)
			end))
		----------------------------------------------------------------------
		----------------------------------------------------------------------
		local unfocus = gears.surface.load_uncached(
			ghost_icon)
		--local unfocus_icon = gears.color.recolor_image(unfocus, color.light)
		local empty = gears.surface.load_uncached(
			empty1_icon)
		--local empty_icon = gears.color.recolor_image(empty, "#4C6070")
		local focus = gears.surface.load_uncached(
			pacman_icon)
		--local focus_icon = gears.color.recolor_image(focus, color.yellow --[["#f76a65"]])

		----------------------------------------------------------------------
		----------------------------------------------------------------------

		-- Function to update the tags
		local update_tags = function(self, c3)
			local tagicon = self:get_children_by_id('icon_role')[1]
			if c3.selected then
				tagicon.image = focus
			elseif #c3:clients() == 0 then
				tagicon.image = empty
			else
				tagicon.image = unfocus
			end
		end
		----------------------------------------------------------------------
		----------------------------------------------------------------------

		local icon_taglist = awful.widget.taglist {
			screen = s,
			filter = awful.widget.taglist.filter.all,
			layout = { spacing = 0, layout = wibox.layout.fixed.horizontal },
			widget_template = {
				{
					{ id = 'icon_role', widget = wibox.widget.imagebox },
					id = 'margin_role',
					top = dpi(0),
					bottom = dpi(0),
					left = dpi(2),
					right = dpi(2),
					widget = wibox.container.margin
				},
				id = 'background_role',
				widget = wibox.container.background,
				create_callback = function(self, c3, index, objects)
					update_tags(self, c3)
				end,

				update_callback = function(self, c3, index, objects)
					update_tags(self, c3)
				end
			},
			buttons = taglist_buttons
		}
		return icon_taglist
	end

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s, { style = { disable_name = true, spacing = 3 } })
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function() awful.layout.inc(1) end),
		awful.button({}, 3, function() awful.layout.inc(-1) end),
		awful.button({}, 4, function() awful.layout.inc(1) end),
		awful.button({}, 5, function() awful.layout.inc(-1) end)))
	-- Create a taglist widget
	--[[s.mytaglist = awful.widget.taglist {
		screen  = s,
		filter  = awful.widget.taglist.filter.all,
		buttons = taglist_buttons
	}]]

	s.mytaglist = get_taglist(s)

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist {
		screen  = s,
		filter  = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons
	}

	function rounded_shape(cr, width, height)
		gears.shape.rounded_rect(cr, width, height, 20)
	end

	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = 40,
		width = s.full,
		border_width = 7,
		--ontop = true,
		shape = rounded_shape
	})

	s.mywibox:setup {
		layout = wibox.layout.align.horizontal,
		{
			add_margin(dashboard, 7),
			add_margin(s.mytaglist, 7),
			--add_margin(s.mytasklist, 15),
			layout = wibox.layout.align.horizontal,
		},
		{
			layout = wibox.layout.align.horizontal,
			add_margin(s.mypromptbox, 3)
		},
		{
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
			add_margin(wifi, 7),
			--wifi_applet,
			add_margin(cpu, 7),
			add_margin(hdd, 7),
			--add_margin(fs_widget({ mounts = { '/', '/home' } }), 7),
			add_margin(mem, 7),
			add_margin(date, 7),
			add_margin(volume_widget, 7),
			add_margin(s.mylayoutbox, 10),
			layout = wibox.layout.fixed.horizontal,
		},
		left = 100
	}
end)
