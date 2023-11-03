local wibox = require('wibox')
local gfs = require("gears.filesystem")
local icon = gfs.get_configuration_dir() .. '/icons/menu.png'
local awful = require('awful')
local gears = require('gears')

-- Crear el widget de fecha
local mem = wibox.widget.imagebox(icon)

--[[local dash_pop = awful.popup {
  widget = wibox.widget {
    text = 'Hola Mundo',
    forced_height = 10,
    widget = wibox.widget.textbox
  },
  maximum_width = 400,
  border_color = '#242424',
  border_width = 2,
  visible = false
}


mem:buttons(gears.table.join(awful.button({}, 1, function()
  if dash_pop.visible then
    dash_pop.visible = not dash_pop.visible
  else
    dash_pop:move_next_to(mouse.current_widget_geometry)
  end
end)))]]

return mem
