local wezterm = require("wezterm")
local act = wezterm.action

local config

if wezterm.config_builder then
	config = wezterm.config_builder()
else
	config = {}
end

-- Appearence ----------------------------------------------------------------------
-- Colors & Background
config.window_background_image = os.getenv("HOME") .. "/.config/wezterm/background"
config.window_background_image_hsb = {
	brightness = 0.1,
}
config.text_background_opacity = 0.75
-- config.window_decorations = "RESIZE" -- Might this be incompatible with KDE?

-- Font
config.font = wezterm.font("JetbrainsMono NFM")
config.font_size = 11

-- Tab Bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}

-- Keybinds ------------------------------------------------------------------------
config.leader = { key = "`", modes = "NONE" }
config.keys = {
	-- Send ` when pressing ` twice.
	{ key = "`", mods = "LEADER", action = act.SendKey({ key = "`" }) },
	-- Windows
	{ key = "w", mods = "LEADER", action = act.SpawnWindow },
	-- Tabs
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "n", mods = "LEADER", action = act.ShowTabNavigator },
	{ key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },
	{ key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
	-- Splits
	{ key = "s", mods = "LEADER", action = act.SplitHorizontal },
	{ key = "v", mods = "LEADER", action = act.SplitVertical },
	-- Panes
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "Resize", one_shot = false }) },
	{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	-- Workspaces
	{ key = "y", mods = "LEADER", action = act.SwitchToWorkspace({ name = "default" }) },
	{
		key = "u",
		mods = "LEADER",
		action = act.SwitchToWorkspace({ name = "monitoring", spawn = { args = { "top" } } }),
	},
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}

config.key_tables = {
	Resize = {
		{ key = "h", mods = "NONE", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "j", mods = "NONE", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ key = "k", mods = "NONE", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "l", mods = "NONE", action = act.AdjustPaneSize({ "Right", 5 }) },
		{ key = "Escape", mods = "NONE", action = "PopKeyTable" },
		{ key = "Enter", mods = "NONE", action = "PopKeyTable" },
	},
}

config.status_update_interval = 1000
wezterm.on("update-status", function(window, pane)
	-- Workspace name
	local stat = window:active_workspace()
	local stat_color = "#f7768e"
	-- It's a little silly to have workspace name all the time
	-- Utilize this to display LDR or current key table name
	if window:active_key_table() then
		stat = window:active_key_table()
		stat_color = "#7dcfff"
	end
	if window:leader_is_active() then
		stat = "LDR"
		stat_color = "#bb9af7"
	end

	local basename = function(s)
		-- Nothing a little regex can't fix
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	-- Current working directory
	local cwd = pane:get_current_working_dir()
	if cwd then
		if type(cwd) == "userdata" then
			-- Wezterm introduced the URL object in 20240127-113634-bbcac864
			cwd = basename(cwd.file_path)
		else
			-- 20230712-072601-f4abf8fd or earlier version
			cwd = basename(cwd)
		end
	else
		cwd = ""
	end

	-- Current command
	local cmd = pane:get_foreground_process_name()
	-- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l)
	cmd = cmd and basename(cmd) or ""

	-- Time
	local time = wezterm.strftime("%H:%M")

	-- Left status (left of the tab line)
	window:set_left_status(wezterm.format({
		{ Foreground = { Color = stat_color } },
		{ Text = "  " },
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
		{ Text = " |" },
	}))

	-- Right status
	window:set_right_status(wezterm.format({
		-- Wezterm has a built-in nerd fonts
		-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
		{ Text = " | " },
		{ Foreground = { Color = "#e0af68" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = "  " },
	}))
end)

return config
