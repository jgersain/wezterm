-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

local config = {}
local backgroundConfig = require 'background_config'

backgroundConfig.set_background(config)
config.font =
  wezterm.font('JetBrains Mono', { weight = 'Bold' })
config.font_size = 14.0
config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.6,
}

config.keys = {
  {
    key = 'RightArrow',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
	{
    key = "DownArrow",
    mods = "SHIFT|ALT",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = 'z',
    mods = 'CTRL',
    action = wezterm.action.TogglePaneZoomState,
  },
	{
		key = 'UpArrow', 
		mods = 'CTRL', 
		action = act.ScrollByPage(-0.1)
	},
	{
		key = 'DownArrow', 
		mods = 'CTRL', 
		action = act.ScrollByPage(0.1)
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

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'

-- and finally, return the configuration to wezterm
return config
