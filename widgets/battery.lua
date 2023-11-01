local vc = require('vicious')
local wibox = require('wibox')
local gfs = require("gears.filesystem")
local icon = gfs.get_configuration_dir() .. '/icons/crayon/heart.png'

-- Crear el widget de fecha
local bat_text = wibox.widget.textbox()
vc.register(bat_text, vc.widgets.bat, ' $2% ', 10, 'BAT1')

-- Crear el widget de imagen
local bat_icon = wibox.widget.imagebox(icon)

local bat_combined = wibox.layout.fixed.horizontal()
bat_combined:add(bat_icon)
bat_combined:add(bat_text)

local bat = bat_combined

return bat
