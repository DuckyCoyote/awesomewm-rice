local wibox = require('wibox')
local gfs = require("gears.filesystem")
local icon = gfs.get_configuration_dir() .. '/icons/menu.png'
local awful = require('awful')
local gears = require('gears')
local dpi = require('beautiful.xresources').apply_dpi

-- Crear el widget de fecha
local launcher = wibox.widget.imagebox(icon)

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

--[[
      500 500 500 100
  600     250
          250
          100
  300
--]]


local photo = gfs.get_configuration_dir() .. '/polar.jpg'
local photo_widget = wibox.widget({
  {
    image = photo,
    widget = wibox.widget.imagebox,
    forced_width = 300,
    forced_height = 300,
    resize = true,
    clip_shape = rounded_shape,
  },
  forced_height = 400,
  halign = "center",
  valign = "center",
  layout = wibox.container.place
})

local name = wibox.widget(
  {
    text = 'DuckyCoyote',
    align = 'center',
    forced_width = dpi(50),
    font = 'FiraCode Nerd Font 30',
    widget = wibox.widget.textbox
  })

local profile_widget = wibox.widget {
  {
    photo_widget,
    name,
    forced_width = 500,
    forced_height = 500,
    layout = wibox.layout.align.vertical,
  },
  bg = '#fff',
  layout = wibox.container.place,
  widget = wibox.container.background
}

local phrase_widget = wibox.widget {
  {
    text = '\"La muerte nos sonrie \n a todos, devolvamosle \n la sonrisa\"',
    font = 'FiraCode Nerd Font 20',
    align = 'center',
    widget = wibox.widget.textbox
  },
  {
    text = ' ~ Gladiador ~ ',
    font = 'FiraCode Nerd Font 20',
    align = 'center',
    widget = wibox.widget.textbox
  },
  forced_height = 300,
  layout = wibox.layout.align.vertical
}

local final_widget = wibox.widget {
  homogeneous   = false,
  spacing       = 5,
  min_cols_size = 10,
  min_rows_size = 10,
  layout        = wibox.layout.grid
}

final_widget:add_widget_at(profile_widget, 2, 1, 1, 1)
final_widget:add_widget_at(phrase_widget, 4, 1, 1, 1)

local dash_pop = awful.popup {
  widget        = wibox.widget {
    text = 'Hola Mundo',
    forced_width = 1600,
    forced_height = 900,
    widget = wibox.widget.textbox
  },
  ontop         = true,
  maximum_width = 1800,
  bg            = "#303030",
  border_color  = '#242424',
  border_width  = 2,
  placement     = awful.placement.centered,
  visible       = false
}

dash_pop:setup({
  --[[ {
    profile_widget,
    margins = 10,
    widget = wibox.container.margin,
  },
  {
    phrase_widget,
    widget = wibox.container.margin
  },
  margin = 10,
  widget = wibox.container.margin,
  layout = wibox.layout.fixed.vertical]]
  final_widget,
  layout = wibox.layout.grid
})

launcher:buttons(gears.table.join(awful.button({}, 1, function()
  if dash_pop.visible then
    dash_pop.visible = not dash_pop.visible
  else
    dash_pop:move_next_to(mouse.current_widget_geometry)
  end
end)))

return launcher
