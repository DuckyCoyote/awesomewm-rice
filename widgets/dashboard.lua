local wibox = require('wibox')
local gfs = require("gears.filesystem")
local icon = gfs.get_configuration_dir() .. '/icons/dashboard.png'

-- Crear el widget de fecha
local mem = wibox.widget.imagebox(icon)


return mem

