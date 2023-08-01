local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

wezterm.on('gui-startup', function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.default_prog = { "/opt/homebrew/bin/nu", "-l" }
config.window_decorations = "RESIZE"
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.7,
}
config.color_scheme = "tokyonight_storm"
config.colors = {
	cursor_bg = 'orange',
}
config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 14
config.line_height = 1.2
config.use_dead_keys = false
config.scrollback_lines = 5000
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	font = wezterm.font({ family = "Noto Sans", weight = "Regular" }),
}

return config
