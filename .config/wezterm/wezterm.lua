local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.bold_brightens_ansi_colors = true
config.color_scheme = 'Tango (terminal.sexy)'
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

return config
