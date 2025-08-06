-- vim: foldmethod=marker foldmarker={{{,}}}
---@diagnostic disable: lowercase-global,undefined-global

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
require("awful.autofocus")

require("errors")
require("optics")
require("vars")
require("wibar")
require("mouse")
require("rules")
require("signals")
