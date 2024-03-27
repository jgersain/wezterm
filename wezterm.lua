-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

local config = {}
local backgroundConfig = require 'background_config'

backgroundConfig.set_background(config)
config.font =
  wezterm.font('JetBrains Mono', { weight = 'Bold' })
config.font_size = 14.0

config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = 'RightArrow',
    mods = 'SHIFT|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- {
  --   key = ''
  --   mods = 'CTRL',
  --   action = wezterm.action.TogglePaneZoomState,
  -- },
}

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'

-- and finally, return the configuration to wezterm
return config