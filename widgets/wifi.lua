local vc = require('vicious')
local wibox = require('wibox')
local gfs = require("gears.filesystem")
local icon = gfs.get_configuration_dir() .. '/icons/crayon/wifi.png'

-- Crear el widget de fecha
local wifi_text = wibox.widget.textbox()
vc.register(wifi_text, vc.widgets.wifi, " TotalPlay", 10, 'wlp4s0')
-- Crear el widget de imagen
local wifi_icon = wibox.widget.imagebox(icon)

local wifi_combined = wibox.layout.fixed.horizontal()
wifi_combined:add(wifi_icon)
wifi_combined:add(wifi_text)

local wifi = wifi_combined

return wifi
