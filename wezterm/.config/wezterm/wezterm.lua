local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.default_prog = { "/opt/homebrew/bin/nu", "-l" }
config.default_cursor_style = "SteadyBlock"
config.window_decorations = "RESIZE"
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}
config.quit_when_all_windows_are_closed = true
config.color_scheme = "tokyonight_storm"
config.colors = {
	cursor_bg = "orange",
}
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13
config.line_height = 1.2
config.use_dead_keys = false
config.scrollback_lines = 5000
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	font = wezterm.font({ family = "Noto Sans", weight = "Regular" }),
}

-- config.disable_default_key_bindings = true

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- copy paste
	{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
	{ key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
	-- misc
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
  { key = "t", mods = "LEADER", action = act.ActivateKeyTable({ name = "activate_tab" }), timeout_milliseconds = 1000 },
  -- { key = "p", mods = "LEADER", action = act.ActivateKeyTable({ name = "activate_pane" }), timeout_milliseconds = 1000 },
	{ key = "-", mods = "SUPER", action = act.DecreaseFontSize },
	{ key = "+", mods = "SUPER", action = act.IncreaseFontSize },
	{ key = "0", mods = "SUPER", action = act.ResetFontSize },
	{ key = "P", mods = "SUPER|SHIFT", action = act.ActivateCommandPalette },
	{ key = "L", mods = "CTRL|SHIFT", action = act.ShowDebugOverlay },


	{ key = "i", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
}

config.key_tables = {
	resize_pane = {
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },
    -- Cancel the mode by pressing escape
    { key = 'Escape', action = 'PopKeyTable' },	},
	-- activate_pane = {
	-- { key = "i", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- { key = "v", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- { key = "x", action = act.CloseCurrentPane({ confirm = true }) },
	-- { key = "h", action = act.ActivatePaneDirection("Left") },
	-- { key = "j", action = act.ActivatePaneDirection("Down") },
	-- { key = "k", action = act.ActivatePaneDirection("Up") },
	-- { key = "l", action = act.ActivatePaneDirection("Right") },
	-- { key = "z", action = act.TogglePaneZoomState },
	-- },
	activate_tab = {
	{ key = "l", action = act.ActivateTabRelative(1) },
	{ key = "h", action = act.ActivateTabRelative(-1) },
	{ key = "n", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "x", action = act.CloseCurrentTab({ confirm = true }) },
	}
}
return config
