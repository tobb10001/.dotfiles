local awful = require("awful")
local gears = require("gears")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

local globalkeys = gears.table.join(
	awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

	-- Cycle through visible windows
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	-- awful.key({ modkey, }, "w", function() mymainmenu:show() end,
	--     { description = "show main menu", group = "awesome" }),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey, "Control" }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	-- Non-layout controls
	-- awful.key({ modkey }, "Return", function()
	-- 	awful.spawn(terminal)
	-- end, { description = "Open a Terminal", group = "launcher" }),
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "Reload Awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "Quit Awesome", group = "awesome" }),
	awful.key({ modkey }, "x", function()
		awful.spawn("lxqt-leave --lockscreen")
	end, { description = "Lock Screen", group = "awesome" }),
	awful.key({ modkey }, "p", function()
		awful.spawn("lxqt-config-monitor")
	end, { description = "Monitor Settings", group = "awesome" }),
	awful.key({ modkey }, "r", function()
		menubar.show()
	end, { description = "show the menubar", group = "awesome" }),
	awful.key({ modkey }, "ß", function()
		awful.util.spawn("setxkbmap gb")
	end, { description = "Set keymap to GB" }),
	awful.key({ modkey }, "-", function()
		awful.util.spawn("setxkbmap -layout de -variant nodeadkeys")
	end, { description = "Set keymap to GB" }),

	-- Prompt
	-- awful.key({ modkey }, "r", function() awful.screen.focused().mypromptbox:run() end,
	--     { description = "run prompt", group = "launcher" }),

	-- awful.key({ modkey, "Control" }, "x",
	--     function()
	--         awful.prompt.run {
	--             prompt       = "Run Lua code: ",
	--             textbox      = awful.screen.focused().mypromptbox.widget,
	--             exe_callback = awful.util.eval,
	--             history_path = awful.util.get_cache_dir() .. "/history_eval"
	--         }
	--     end,
	--     { description = "lua execute prompt", group = "awesome" }),
	-- Menubar

	-- XF86Keys
	awful.key({}, "XF86AudioPlay", function()
		awful.util.spawn("playerctl play-pause")
	end),
	awful.key({}, "XF86AudioNext", function()
		awful.util.spawn("playerctl next")
	end),
	awful.key({}, "XF86AudioPrev", function()
		awful.util.spawn("playerctl prev")
	end),
	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.util.spawn("amixer -c 1 set Master 1dB+")
	end),
	awful.key({}, "XF86AudioLowerVolume", function()
		awful.util.spawn("amixer -c 1 set Master 1dB-")
	end),
	awful.key({}, "XF86AudioMute", function()
		awful.util.spawn("amixer -c 1 set Master toggle")
	end),
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.util.spawn("lxqt-backlight_backend --inc")
	end),
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.util.spawn("lxqt-backlight_backend --dec")
	end)
)

local clientkeys = gears.table.join(
	awful.key({ modkey }, "z", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),
	awful.key({ modkey, "Shift" }, "x", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	awful.key({ modkey, "Control" }, "s", function(c)
		c.sticky = not c.sticky
	end, { description = "toggle sticky", group = "client" }),
	awful.key(
		{ modkey, "Control" },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),
	awful.key({ modkey, "Control" }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, { description = "move to master", group = "client" }),
	awful.key({ modkey, "Control" }, "m", function(c)
		c:move_to_screen()
	end, { description = "move to screen", group = "client" }),
	-- awful.key({ modkey, }, "t", function(c) c.ontop = not c.ontop end,
	--     { description = "toggle keep on top", group = "client" }),
	awful.key({ modkey }, "n", function(c)
		-- The client currently has the input focus, so it cannot be
		-- minimized, since minimized clients can't have the focus.
		c.minimized = true
	end, { description = "minimize", group = "client" })
	-- awful.key({ modkey }, "m", function(c)
	-- 	c.maximized = not c.maximized
	-- 	c:raise()
	-- end, { description = "(un)maximize", group = "client" }),
	-- awful.key({ modkey, "Control" }, "m", function(c)
	-- 	c.maximized_vertical = not c.maximized_vertical
	-- 	c:raise()
	-- end, { description = "(un)maximize vertically", group = "client" }),
	-- awful.key({ modkey, "Shift" }, "m", function(c)
	-- 	c.maximized_horizontal = not c.maximized_horizontal
	-- 	c:raise()
	-- end, { description = "(un)maximize horizontally", group = "client" })
)

-- Bind top row to tags.
for i, key in ipairs({
	"t",
	"b",
	"c",
	"o",
	"y",
}) do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, key, function()
			for s in screen do
				local tag = s.tags[i]
				if tag then
					tag:view_only()
				end
			end
			-- This is a hack:
			client.focus = mouse.object_under_pointer()
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, key, function()
			-- TODO: Make this work for all screens.
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, key, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, key, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

local clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)

return clientkeys, clientbuttons
