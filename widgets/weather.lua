local vc = require('vicious')
local wibox = require('wibox')
local gfs = require("gears.filesystem")
local icon = gfs.get_configuration_dir() .. '/icons/crayon/weather.png'

-- Crear el widget de fecha
local weather_text = wibox.widget.textbox()
vc.register(weather_text, vc.widgets.weather, " ${tempc}°C", 10, 'MMMX')
local weather_icon = wibox.widget.imagebox(icon)

local weather_combined = wibox.layout.fixed.horizontal()
weather_combined:add(weather_icon)
weather_combined:add(weather_text)

local weather = weather_combined

return weather
