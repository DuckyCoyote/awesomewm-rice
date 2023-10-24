local vc = require('vicious')
local wibox = require('wibox')
local gfs = require("gears.filesystem")
local icon = gfs.get_configuration_dir() .. '/icons/crayon/mem.png'

-- Crear el widget de fecha
local memwidget = wibox.widget.textbox()
vc.cache(vc.widgets.mem)
vc.register(memwidget, vc.widgets.mem, " $2 MiB", 13)
-- Crear el widget de imagen
local mem_icon = wibox.widget.imagebox(icon)

local mem_combined = wibox.layout.fixed.horizontal()
mem_combined:add(mem_icon)
mem_combined:add(memwidget)

local mem = mem_combined

return mem
