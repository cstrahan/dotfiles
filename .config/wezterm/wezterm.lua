local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.enable_kitty_keyboard = true
config.use_resize_increments = true
config.enable_scroll_bar = true

-- disable ligatures
config.harfbuzz_features = {
  'calt=0',
  'clig=0',
  'liga=0',
}

-- blinking cursor
-- config.default_cursor_style = 'BlinkingBlock'
-- config.cursor_blink_ease_in = 'Constant'
-- config.cursor_blink_ease_out = 'Constant'
-- config.cursor_blink_rate = 600

config.color_scheme = 'Tango (terminal.sexy)'
-- make the scrollbar thumb more visible
config.color_schemes = wezterm.get_builtin_color_schemes()
local color_scheme = config.color_schemes[config.color_scheme]
color_scheme.scrollbar_thumb = "555555"

config.bold_brightens_ansi_colors = true
config.font_size = 16
config.font = wezterm.font_with_fallback {
  'JetBrains Mono',
  -- 'Iosevka Term',
  -- 'Comic Shanns Mono',
}

local act = wezterm.action
config.keys = {
  { key = 'UpArrow', mods = 'SHIFT', action = act.ScrollToPrompt(-1) },
  { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollToPrompt(1) },
}

-- more visible tabs
config.window_frame = {
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },
  font_size = 14.0,
}

return config
