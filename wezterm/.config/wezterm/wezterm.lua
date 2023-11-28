---@type Wezterm
local wezterm = require("wezterm")
local config = wezterm.config_builder()
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

config.underline_thickness = 3
config.cursor_thickness = 4
config.underline_position = -6
config.window_decorations = "RESIZE"

-- config.colors = {
-- 	cursor_bg = "orange",
-- }
-- Fonts
config.font_size = 13
-- config.font = wezterm.font({ family = "JetBrainsMono Nerd Font" })
config.font = wezterm.font({ family = "FiraCode Nerd Font Mono", weight = "Regular" })
config.bold_brightens_ansi_colors = true

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.force_reverse_video_cursor = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
-- window_background_opacity = 0.9,
-- cell_width = 0.9,
config.scrollback_lines = 10000
-- config.default_prog = { "/bin/zsh", "-l", "-c", "zellij attach base || zellij attach -c base" }
config.quit_when_all_windows_are_closed = true
config.line_height = 1.2
config.use_dead_keys = false
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true

return config --[[@as Wezterm]]
