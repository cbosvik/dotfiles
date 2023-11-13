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
config.font_size = 12
config.font = wezterm.font({ family = "JetBrainsMono Nerd Font" })
config.bold_brightens_ansi_colors = true
-- config.font_rules = {
--   {
--     intensity = "Bold",
--     italic = true,
--     font = wezterm.font({ family = "Maple Mono", weight = "Bold", style = "Italic" }),
--   },
--   {
--     italic = true,
--     intensity = "Half",
--     font = wezterm.font({ family = "Maple Mono", weight = "DemiBold", style = "Italic" }),
--   },
--   {
--     italic = true,
--     intensity = "Normal",
--     font = wezterm.font({ family = "Maple Mono", style = "Italic" }),
--   },
-- }

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.force_reverse_video_cursor = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
-- window_background_opacity = 0.9,
-- cell_width = 0.9,
config.scrollback_lines = 10000

return config --[[@as Wezterm]]
