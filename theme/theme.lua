local gears = require('gears')
local color = require('theme/.palette')
local theme_assets = require('beautiful.theme_assets')
local xresources = require('beautiful.xresources')
local gfs = require('gears.filesystem')
local dpi = xresources.apply_dpi
local theme_path = gfs.get_configuration_dir() .. '/themes/'

local theme = {}

--theme.font = "Hack Nerd Font Bold 11"
theme.font = "Cartograph CF 11"

theme.wallpaper = '/home/duckycoyote/wallcastle.jpg'

theme.bg_normal = color.dark
theme.bg_focus = color.dark
theme.bg_minimize = color.dark
theme.bg_systray = color.dark

theme.useless_gap = dpi(7)
--theme.border_radius = dpi(50)
theme.tasklist_disable_task_name = true

theme.fg_normal = color.light
theme.fg_focus = color.light_active

theme.border_width = dpi(4)
theme.border_normal = color.dark
theme.border_focus = color.dark_inactive

-- Menu Colors

theme.menu_font = 'Roboto Mono Nerd Font 15'
theme.menu_height = dpi(20)
theme.menu_width = dpi(200)
theme.menu_border_width = dpi(2)
theme.menu_border_radius = dpi(50)
theme.menu_bg_normal = color.dark
theme.menu_fg_normal = color.light
theme.menu_bg_focus = color.dark_inactive
theme.menu_fg_focus = color.light_active

-- Notifications
function rounded_shape(cr, width, height)
	gears.shape.margin = margin
	gears.shape.rounded_rect(cr, width, height, 10)
end

theme.notification_width = dpi(300)
theme.notification_height = dpi(100)
theme.notification_shape = rounded_shape

theme.notification_icon_resize_strategy = 'center'
theme.notification_icon_size = dpi(300)


return theme
