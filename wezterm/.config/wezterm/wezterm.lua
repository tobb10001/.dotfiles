local wezterm = require("wezterm")
local act = wezterm.action

local config

if wezterm.config_builder then
	config = wezterm.config_builder()
else
	config = {}
end

HOME = os.getenv("HOME")
BACKGROUND_IMAGE = HOME .. "/.config/wezterm/background"

wezterm.on("toggle-background", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if overrides.window_background_image then
		overrides.window_background_image = nil
	else
		overrides.window_background_image = BACKGROUND_IMAGE
	end
	window:set_config_overrides(overrides)
end)

-- General Options -----------------------------------------------------------------
config.default_prog = { "fish" }
config.warn_about_missing_glyphs = false

-- Appearence ----------------------------------------------------------------------
-- Colors & Background
config.window_background_image = nil
config.color_scheme = "Tokyo Night"
config.window_background_image_hsb = {
	brightness = 0.05,
}
config.text_background_opacity = 1
-- config.window_decorations = "RESIZE" -- Might this be incompatible with KDE?

-- Font
config.font_size = 11

-- Tab Bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.75,
	brightness = 0.75,
}

-- Plugins -------------------------------------------------------------------------

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

-- Keybinds ------------------------------------------------------------------------
-- config.leader = { key = "`", mods = "NONE" }
config.keys = {
	-- Send ` when pressing ` twice.
	-- { key = "`", mods = "META", action = act.SendKey({ key = "`" }) },
	-- Windows
	-- { key = "w", mods = "META", action = act.SpawnWindow },
	{ key = "p", mods = "META", action = act.EmitEvent("toggle-background") },
	-- Tabs
	{ key = "t", mods = "META", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "]", mods = "META", action = act.ActivateTabRelative(1) },
	{ key = "[", mods = "META", action = act.ActivateTabRelative(-1) },
	{ key = "n", mods = "META", action = act.ShowTabNavigator },
	{ key = "}", mods = "META|SHIFT", action = act.MoveTabRelative(1) },
	{ key = "{", mods = "META|SHIFT", action = act.MoveTabRelative(-1) },
	-- Splits
	-- They seem to be the wrong way round, but this matches the way in which vim's
	-- :split and :vsplit work.
	{ key = "v", mods = "META", action = act.SplitHorizontal },
	{ key = "s", mods = "META", action = act.SplitVertical },
	-- Panes
	{ key = "h", mods = "META", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "META", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "META", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "META", action = act.ActivatePaneDirection("Right") },
	{ key = "z", mods = "META", action = act.TogglePaneZoomState },
	{ key = "r", mods = "META", action = act.ActivateKeyTable({ name = "Resize", one_shot = false }) },
	{ key = "o", mods = "META", action = act.RotatePanes("Clockwise") },
	-- Workspaces
	{ key = "y", mods = "META", action = act.SwitchToWorkspace({ name = "default" }) },
	{
		key = "u",
		mods = "META",
		action = act.SwitchToWorkspace({ name = "monitoring", spawn = { args = { "top" } } }),
	},
	{ key = "w", mods = "META", action = workspace_switcher.switch_workspace() },
	{
		key = "c",
		mods = "META",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Enter name for new workspace" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:perform_action(
						act.SwitchToWorkspace({
							name = line,
						}),
						pane
					)
				end
			end),
		}),
	},
	-- Debugging
	{ key = "d", mods = "META", action = act.ShowDebugOverlay },
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "META",
		action = act.ActivateTab(i - 1),
	})
end

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

config.status_update_interval = 200
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
	local proc_info = pane:get_foreground_process_info()
	local proc = "-/-"
	if proc_info ~= nil then
		proc = proc_info.name .. " (" .. proc_info.pid .. ")"
	end

	-- Time
	local time = wezterm.strftime("%H:%M:%S")

	-- Left status (left of the tab line)
	window:set_left_status(wezterm.format({
		{ Foreground = { Color = stat_color } },
		{ Text = "  " },
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
	}))

	-- Right status
	window:set_right_status(wezterm.format({
		-- Wezterm has a built-in nerd fonts
		-- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
		{ Text = " | " },
		{ Foreground = { Color = "#e0af68" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. proc },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = "  " },
	}))
end)

return config
