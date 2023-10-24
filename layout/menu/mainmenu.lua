local beautiful = require("beautiful")
local awful = require("awful")
local myawesomemenu = require('layout/menu/.myawesomemenu')

local mymainmenu = awful.menu({
	items = {
		{ "  Terminal", terminal },
		{ "  Browser", "firefox" },
		{ "  Awesome", myawesomemenu, beautiful.awesome_icon },
	}
})

return mymainmenu
