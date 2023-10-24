local vc = require('vicious')
local wibox = require('wibox')

-- Crear el widget de fecha
local cpu_icon = wibox.widget.textbox('  ')
cpu_icon:set_markup('<span color="#fd6b85" size="17000">' .. cpu_icon.text .. '</span>')

local cpu_text = wibox.widget.textbox()
vc.register(cpu_text, vc.widgets.cpu, ' $1 %')

local cpu_combined = wibox.layout.fixed.horizontal();
cpu_combined:add(cpu_icon)
cpu_combined:add(cpu_text)

local cpu = cpu_combined

return cpu
