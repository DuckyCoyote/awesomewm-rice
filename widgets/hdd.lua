local vc = require('vicious')
local wibox = require('wibox')
local gfs = require("gears.filesystem")
local icon = gfs.get_configuration_dir() .. '/icons/crayon/storage.png'

-- Crear el widget de fecha
local hdd_text = wibox.widget.textbox()
vc.register(hdd_text, vc.widgets.fs, ' /${/ avail_gb} Gb ')

-- Crear el widget de imagen
local hdd_icon = wibox.widget.imagebox(icon)

local hdd_combined = wibox.layout.fixed.horizontal()
hdd_combined:add(hdd_icon)
hdd_combined:add(hdd_text)

local hdd = hdd_combined

return hdd
