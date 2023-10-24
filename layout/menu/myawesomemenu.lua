local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

local myawesomemenu = {
	{ "󰌌  Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
	{ "󰈙  Manual", terminal .. " -e man awesome" },
	{ "  Config", editor_cmd .. " " .. awesome.conffile },
	{ "  Restart", awesome.restart },
	{ "󰍃  Quit", function() awesome.quit() end },
}

return myawesomemenu
