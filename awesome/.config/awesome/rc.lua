-- vim: foldmethod=marker foldmarker={{{,}}}
---@diagnostic disable: lowercase-global,undefined-global

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local awful = require("awful")
require("awful.autofocus")

require("errors")
require("optics")
require("vars")
local mylauncher = require("menu")
require("wibar").setup(mylauncher)
require("mouse")
local clientkeys, clientbuttons = require("keybindings")
require("rules").setup(clientkeys, clientbuttons)
require("signals")

-- Autostart
HOME = os.getenv("HOME")
awful.spawn("blueman-applet")
awful.spawn("kanata")
awful.spawn("nm-applet")
awful.spawn.with_shell("pkill pasystray; pasystray")
awful.spawn("xss-lock --transfer-sleep-lock -- i3lock --nofork -i " ..
    HOME .. "/Images/Backgrounds/abheben-anfang-astronomie-2166.png")
-- TODO: Refactor to not pull the image from the wezterm dir.
