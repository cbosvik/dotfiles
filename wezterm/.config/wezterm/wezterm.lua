---@type Wezterm
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux
-- local terminal_font = "JetBrainsMono Nerd Font"
local terminal_font = "CaskaydiaCove Nerd Font"
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)
config.term = "wezterm"

wezterm.log_info("reloading")

require("tabs").setup(config)
require("links").setup(config)
require("keys").setup(config)

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
-- config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

-- Colorscheme
config.color_scheme = "tokyonight"
-- config.color_scheme = "tokyonight"

config.underline_thickness = 3
config.cursor_thickness = 4
config.underline_position = -6
config.window_decorations = "RESIZE"

-- config.colors = {
-- 	cursor_bg = "orange",
-- }
-- Fonts
config.font_size = 13
-- config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.font = wezterm.font({ family = terminal_font, weight = "Light" })
-- config.font = wezterm.font({ family = "Hack Nerd Font", weight = "Regular" })
-- config.font = wezterm.font({ family = "FiraCode Nerd Font", weight = "Regular" })
config.font = wezterm.font({ family = terminal_font, weight = "Light", stretch = "Normal", style = "Normal" })
config.bold_brightens_ansi_colors = true
config.font_rules = {
	{
		intensity = "Bold",
		italic = false,
		font = wezterm.font({ family = terminal_font, weight = "Bold", style = "Normal" }),
	},

	-- Bold-and-italic
	{
		intensity = "Bold",
		italic = true,
		-- font = wezterm.font(terminal_font, { weight = "Bold", style = "Italic" }),
		font = wezterm.font({ family = "Victor Mono", weight = "Bold", style = "Italic" }),
	},

	-- normal-intensity-and-italic
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({ family = "Victor Mono", weight = "Regular", style = "Italic" }),
	},
	{
		intensity = "Normal",
		strikethrough = true,
		italic = false,
		-- font = wezterm.font(terminal_font, { weight = "Light", stretch = "Normal", style = "Normal" }),
		font = wezterm.font({ family = terminal_font, weight = "Light", style = "Normal" }),
	},
}

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.force_reverse_video_cursor = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
-- window_background_opacity = 0.9,
-- cell_width = 0.9,
config.scrollback_lines = 10000
-- config.default_prog = { "/bin/zsh", "-l", "-c", "zellij attach base || zellij attach -c base" }
-- config.default_prog = { "/opt/homebrew/bin/nu", "-l" }
-- config.default_prog = { "/opt/homebrew/bin/nu", "-l", "-c", "zellijj attach -c work" }
config.quit_when_all_windows_are_closed = true
config.line_height = 1.2
config.use_dead_keys = false
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true

return config --[[@as Wezterm]]
