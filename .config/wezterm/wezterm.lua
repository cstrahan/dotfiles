-- local config = {}
-- config.debug_key_events = true
-- config.enable_kitty_keyboard = true
-- -- config.use_ime = false
-- config.use_ime = true

-- return config


-- https://luals.github.io/wiki/diagnostics/
---@diagnostic disable: redefined-local
---@diagnostic disable: unused-local

-- https://github.com/quantonganh/dotfiles/blob/main/.wezterm.lua
-- https://hackernoon.com/get-the-most-out-of-your-terminal-a-comprehensive-guide-to-wezterm-configuration
-- https://gilbertsanchez.com/posts/my-terminal-wezterm/
-- https://github.com/wez/wezterm/discussions/628
local wezterm = require 'wezterm'
local act = wezterm.action

local is_dark = wezterm.gui.get_appearance():find("Dark")
local is_linux = wezterm.target_triple:find("linux") ~= nil
local is_darwin = wezterm.target_triple:find("darwin") ~= nil
local scrollback_lines = 5000 -- default is 3500

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- set $TERM to wezterm
config.term = 'wezterm'

config.scrollback_lines = scrollback_lines

-- window decorations aren't (yet) working on Wayland,
-- so disable wayland backend for now.
-- https://github.com/wez/wezterm/issues/4962
config.enable_wayland = false

-- disable kitty keyboard protocol for now due to wezterm bug:
-- IME causes some problems for kitty protocol: https://github.com/wez/wezterm/issues/5193
config.use_ime = false
config.debug_key_events = true
-- kitty protocol still has some kinks: https://github.com/wez/wezterm/issues/3621#issuecomment-1947721248
-- config.enable_kitty_keyboard = false
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

config.adjust_window_size_when_changing_font_size = false

config.color_scheme = 'Tango'
config.color_schemes = require 'color_schemes'

config.bold_brightens_ansi_colors = true
config.font_size = 14
-- config.font_size = 16
config.font = wezterm.font_with_fallback {
  'JetBrains Mono',
  -- 'Iosevka Term',
  -- 'Comic Shanns Mono',
  -- 'Comic Code',
}

config.inactive_pane_hsb = {
  -- default: 0.9
  saturation = 1,
   -- default: 0.8
  brightness = 0.5,
}

local function edit_in_new_tab(window, pane, text)
  if not text then
    return nil
  end
  local path = os.tmpname()
  local f = io.open(path, "w+")
  if not f then
    wezterm.log_error("could not open temp file for writing")
    return
  end
  f:write(text)
  f:flush()
  f:close()
  local args = {
    "zsh",
    "-ic",
    "vi \"$0\"; " ..
      "wezterm cli activate-pane --pane-id \"$1\"",
    path,
    tostring(pane:pane_id())
  }
  window:perform_action(act.SpawnCommandInNewTab { args = args }, pane)
  wezterm.sleep_ms(1000)
  os.remove(path)
end

local function get_last_output(pane)
  local cursor = pane:get_cursor_position()
  -- skip up 2 rows to skip shell prompt
  local zone = pane:get_semantic_zone_at(0, cursor.y-2)
  if zone then
    return pane:get_text_from_semantic_zone(zone)
  end
  return nil
end

local function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane in that tab
  return tab_info.active_pane.title
end

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local title = tab_title(tab)

  -- ensure that the titles fit in the available space.
  title = wezterm.truncate_right(title, max_width)

  return {
    { Text = title },
  }
end)

wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  local zoomed = ''
  if tab.active_pane.is_zoomed then
    zoomed = '[Z] '
  end

  local index = ''
  if #tabs > 1 then
    index = string.format('[%d/%d] ', tab.tab_index + 1, #tabs)
  end

  return zoomed .. index .. tab.active_pane.title
end)

wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

wezterm.on(
  "trigger-nvim-with-visible-text",
  function(window, pane)
    local scrollback = pane:get_lines_as_text()
    edit_in_new_tab(window, pane, scrollback)
  end
)

wezterm.on(
  "trigger-nvim-with-scrollback",
  function(window, pane)
    local scrollback = pane:get_lines_as_text(scrollback_lines)
    edit_in_new_tab(window, pane, scrollback)
  end
)

wezterm.on(
  "trigger-nvim-with-selection",
  function(window, pane)
    local selection = window:get_selection_text_for_pane(pane)
    edit_in_new_tab(window, pane, selection)
  end
)

wezterm.on(
  "trigger-nvim-with-semantic-region",
  function(window, pane)
    local selection = get_last_output(pane)
    edit_in_new_tab(window, pane, selection)
  end
)

wezterm.on(
  "trigger-show-keys",
  function(window, pane)
    local args = {
      "zsh",
      "-ic",
      "TMPSUFFIX=.lua; " ..
        "vi =(wezterm show-keys --lua); " ..
        "wezterm cli activate-pane --pane-id \"$0\"",
      tostring(pane:pane_id())
    }
    window:perform_action(act.SpawnCommandInNewTab { args = args }, pane)
  end
)

wezterm.on(
  "trigger-show-keys-diff",
  function(window, pane)
    local args = {
      "zsh",
      "-ic",
      "TMPSUFFIX=.lua; " ..
        "git diff -U1000 --no-index =(wezterm -n show-keys --lua) =(wezterm show-keys --lua); " ..
        "wezterm cli activate-pane --pane-id \"$0\"",
      tostring(pane:pane_id())
    }
    window:perform_action(act.SpawnCommandInNewTab { args = args }, pane)
  end
)

config.leader = { key = ',', mods = 'SUPER' }
config.keys = {
  -- { key = 'UpArrow', mods = 'SHIFT', action = act.ScrollToPrompt(-1) },
  -- { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollToPrompt(1) },
  { key = 'v', mods = 'SUPER', action = act.PasteFrom('Clipboard') },
  { key = 'p', mods = 'SUPER', action = act.ActivateKeyTable { name = 'edit_text', one_shot = true, }, },

  { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, }, },
  { key = 'a', mods = 'LEADER', action = act.ActivateKeyTable { name = 'activate_pane', timeout_milliseconds = 1000, }, },

  { key = 'k', mods = 'LEADER', action = act.EmitEvent "trigger-show-keys" },
  { key = 'd', mods = 'LEADER', action = act.EmitEvent "trigger-show-keys-diff" },

  --{ key = 'LeftArrow', mods = 'SUPER|CTRL', action = act.SendString '\x1b\x5b1;5D' },
  --{ key = 'RightArrow', mods = 'SUPER|CTRL', action = act.SendString '\x1b\x5b1;5C' },
  { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.SendString '\x1b\x5b1;5D' },
  { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.SendString '\x1b\x5b1;5C' },
  --{ key = '0', mods = 'CTRL', action = act.SendString '\x1b\x5b1;5C' },
 	--{ key = "LeftArrow", mods = "CTRL", action = act.DisableDefaultAssignment },
	--{ key = "RightArrow", mods = "CTRL", action = act.DisableDefaultAssignment },
}

-- CTRL+LEFT:    0x1b 0x5b 1 ; 5 D
-- CTRL+RIGHT:   0x1b 0x5b 1 ; 5 C

config.mouse_bindings = {
  {event = {Down = {streak = 4, button = "Left"}}, mods = "NONE", action = {SelectTextAtMouseCursor = "SemanticZone"}}
}
config.key_tables = {
  resize_pane = {
    { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

    { key = 'Escape', action = 'PopKeyTable' },
  },

  activate_pane = {
    { key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
    { key = 'h', action = act.ActivatePaneDirection 'Left' },

    { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
    { key = 'l', action = act.ActivatePaneDirection 'Right' },

    { key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
    { key = 'k', action = act.ActivatePaneDirection 'Up' },

    { key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
    { key = 'j', action = act.ActivatePaneDirection 'Down' },
  },

  edit_text = {
    { key = "o", action = act.EmitEvent "trigger-nvim-with-semantic-region" },
    { key = "s", action = act.EmitEvent "trigger-nvim-with-selection" },
    { key = "a", action = act.EmitEvent "trigger-nvim-with-scrollback" },
    { key = "v", action = act.EmitEvent "trigger-nvim-with-visible-text" },
  },

  copy_mode = {
    { key = 'UpArrow', mods = 'SHIFT', action = act.CopyMode('MoveBackwardSemanticZone') },
    { key = 'DownArrow', mods = 'SHIFT', action = act.CopyMode('MoveForwardSemanticZone') },

    { key = 'UpArrow',  mods = 'SHIFT', action = act.CopyMode{ MoveBackwardZoneOfType = 'Input' } },
    { key = 'K', mods = 'SHIFT', action = act.CopyMode{ MoveBackwardZoneOfType = 'Input' } },

    { key = 'DownArrow', mods = 'SHIFT', action = act.CopyMode{ MoveForwardZoneOfType = 'Input' } },
    { key = 'J', mods = 'SHIFT', action = act.CopyMode{ MoveForwardZoneOfType = 'Input' } },

    -- defaults:
    { key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
    { key = 'Tab', mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },
    { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
    { key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
    { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = ',', mods = 'NONE', action = act.CopyMode 'JumpReverse' },
    { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
    { key = ';', mods = 'NONE', action = act.CopyMode 'JumpAgain' },
    { key = 'F', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
    { key = 'F', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
    { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
    { key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
    { key = 'H', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
    { key = 'L', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'L', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
    { key = 'M', mods = 'NONE', action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'M', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
    { key = 'O', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'O', mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
    { key = 'T', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
    { key = 'T', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
    { key = 'V', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Line' } },
    { key = 'V', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode =  'Line' } },
    { key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
    { key = 'c', mods = 'CTRL', action = act.CopyMode 'Close' },
    { key = 'd', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },
    { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
    { key = 'f', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = false } } },
    { key = 'f', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
    { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
    { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
    { key = 'g', mods = 'CTRL', action = act.CopyMode 'Close' },
    { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
    { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
    { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
    { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
    { key = 'm', mods = 'ALT', action = act.CopyMode 'MoveToStartOfLineContent' },
    { key = 'o', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEnd' },
    { key = 'q', mods = 'NONE', action = act.CopyMode 'Close' },
    { key = 't', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = true } } },
    { key = 'u', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (-0.5) } },
    { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
    { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode =  'Block' } },
    { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
    { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { CopyMode =  'Close' } } },
    { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
    { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
    { key = 'End', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
    { key = 'Home', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
    { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
    { key = 'LeftArrow', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
    { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
    { key = 'RightArrow', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
    { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
    { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
  },
}

-- more visible tabs
config.window_frame = {
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },
  font_size = 14.0,
}

return config
