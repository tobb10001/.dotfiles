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
require("wibar")
require("mouse")
require("rules")
require("signals")

-- Autostart
HOME = os.getenv("HOME")
-- awful.spawn(HOME .. "/.nix-profile/bin/blueman-applet")
-- awful.spawn.with_shell("pkill kanata; kanata")
-- awful.spawn.with_shell("which nextcloud && nextcloud --background")
-- awful.spawn("nm-applet")
-- awful.spawn.with_shell("pkill pasystray; pasystray")
-- awful.spawn("xss-lock --transfer-sleep-lock -- i3lock --nofork -i " ..
--     HOME .. "/Images/Backgrounds/abheben-anfang-astronomie-2166.png")
-- TODO: Refactor to not pull the image from the wezterm dir.
