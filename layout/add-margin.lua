local wibox = require('wibox')
local function add_margin(widget, margin)
	local margin_widget = wibox.widget {
		widget,
		margins = margin,
		layout = wibox.container.margin
	}
	return margin_widget
end

return add_margin
