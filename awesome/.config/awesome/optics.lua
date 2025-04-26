---@diagnostic disable: undefined-global
local beautiful = require("beautiful")
local gears = require("gears")
local naughty = require("naughty")

-- Theme. Use a premade theme and adjust it.
beautiful.init(gears.filesystem.get_themes_dir() .. "zenburn/theme.lua")

local theme = beautiful.get()

theme.font = "sans 10"

-- Notifications.
naughty.config.defaults.border_width = 2
naughty.config.defaults.border_color = "#88A175"
naughty.config.defaults.shape = function(cr, w, h)
	gears.shape.rounded_rect(cr, w, h, 10)
end
naughty.config.defaults.margin = 15
naughty.config.defaults.padding = 20
naughty.config.defaults.font = "sans 12"

beautiful.init(theme)
