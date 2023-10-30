local vc = require('vicious')
local wibox = require('wibox')
local gfs = require("gears.filesystem")
local icon = gfs.get_configuration_dir() .. '/icons/cpucute.svg'
-- Crear el widget de fecha
--local cpu_icon = wibox.widget.textbox('  ')
--cpu_icon:set_markup('<span color="#fd6b85" size="17000">' .. cpu_icon.text .. '</span>')

local cpu_text = wibox.widget.textbox()
vc.register(cpu_text, vc.widgets.cpu, ' $1 %')

local chip_icon = wibox.widget.imagebox(icon)

local cpu_combined = wibox.layout.fixed.horizontal();
cpu_combined:add(chip_icon)
cpu_combined:add(cpu_text)

local cpu = cpu_combined

return cpu
