-- If LuaRock is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

local gfs = require("gears.filesystem")
local config_path = gfs.get_configuration_dir()

-- Widget and layout library
local wibox = require("wibox")
--Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- Global keys
local globalkeys = require('keys/.globalkeys')

-- Client keys
local clientkeys = require('keys/.clientkeys')

-- Error Handler
require('meta.errorhandler')

-- Theme
local current_theme = require('theme/.theme')
beautiful.init(current_theme)

-- This is used later as the default terminal and editor to run.
terminal = "kitty"
browser = "firefox"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
modkey = "Mod4"

-- Menu
mymainmenu = require("layout/menu/.mainmenu")

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.floating,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.spiral,
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.magnifier,
	awful.layout.suit.corner.nw,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

-- Wibar
require('layout/bar/.bar')

-- Mouse Binding
require('meta.mousebinding')

-- Client Buttons
require('meta.clientbuttons')



-- Set keys
root.keys(globalkeys)
-- }}}

-- Rules
local rulesaws = require('meta/.rules')
awful.rules.rules = rulesaws

-- Signals
require('meta.signals')


os.execute('feh --bg-fill ~/.config/awesome/wall/Knights.png')
-- https://gruvbox-wallpapers.pages.dev/
-- https://www.google.com/search?q=gruvbox+dark+wallpaper&tbm=isch&ved=2ahUKEwjBmf-y_pKCAxViyMkDHYn6BLIQ2-cCegQIABAA&oq=gruvbox+dark+wallpaper&gs_lcp=CgNpbWcQAzIHCAAQExCABDoHCAAQigUQQzoICAAQgAQQsQM6BQgAEIAEOgQIABAeOgYIABAIEB46BggAEB4QE1DCCFiqJ2DSJ2gBcAB4AIABTogBmQySAQIyM5gBAKABAaoBC2d3cy13aXotaW1nwAEB&sclient=img&ei=9vk5ZcHGF-KQp84PifWTkAs&bih=858&biw=1884&client=firefox-b-d#imgrc=zMR8oQSSXujrHM&imgdii=li4ebm8ZpCFCeM
--os.execute('picom &')
awful.spawn.with_shell("picom")

--beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")
