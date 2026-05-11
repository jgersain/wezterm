local wezterm = require 'wezterm'
local act = wezterm.action
local background_config = dofile(wezterm.config_dir .. '/background_config.lua')

local config = wezterm.config_builder()

if wezterm.target_triple:find('windows') then
  config.default_prog = { 'wsl.exe', '--cd', '~' }
end

config.font = wezterm.font {
  family = 'JetBrainsMono Nerd Font',
  weight = 'DemiBold',
}
config.font_size = 16.0

config.colors = {
  foreground = '#ebdbb2',
  background = '#181921',
  cursor_bg = '#f42c3e',
  cursor_fg = '#181921',
  cursor_border = '#f42c3e',
  selection_fg = '#ebdbb2',
  selection_bg = '#334b5a',
  scrollbar_thumb = '#928374',

  ansi = {
    '#1d2021',
    '#cc241d',
    '#98971a',
    '#d79921',
    '#458588',
    '#b16286',
    '#689d6a',
    '#a89984',
  },
  brights = {
    '#928374',
    '#f42c3e',
    '#b8bb26',
    '#fabd2f',
    '#99c6ca',
    '#d3869b',
    '#7ec16e',
    '#ebdbb2',
  },
}

config.cursor_blink_rate = 800
config.enable_scroll_bar = true
config.min_scroll_bar_height = '2cell'
config.max_fps = 120
config.animation_fps = 60
config.alternate_buffer_wheel_scroll_speed = 1
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.6,
}

config.scrollback_lines = 30000
config.keys = {
  {
    key = 'RightArrow',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'DownArrow',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'z',
    mods = 'CTRL',
    action = wezterm.action.TogglePaneZoomState,
  },
  {
    key = 'UpArrow',
    mods = 'CTRL',
    action = act.ScrollByPage(-0.1),
  },
  {
    key = 'DownArrow',
    mods = 'CTRL',
    action = act.ScrollByPage(0.1),
  },
  {
    key = 'UpArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Down',
  },
  {
    key = 'LeftArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'ALT',
    action = act.ActivatePaneDirection 'Right',
  },
}

background_config.set_background(config)

return config
