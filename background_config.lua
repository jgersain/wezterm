local wezterm = require 'wezterm'

local module = {}

local function asset_path(relative_path)
  return wezterm.config_dir .. '/assets/' .. relative_path
end

function module.set_background(config)
  local dimmer = { brightness = 0.04 }

  config.enable_scroll_bar = true
  config.min_scroll_bar_height = '2cell'
  config.colors = config.colors or {}
  config.colors.scrollbar_thumb = 'white'

  config.background = {
    {
      source = {
        File = asset_path 'Alien_Ship_bg_vert_images/Backgrounds/spaceship_bg_1.png',
      },
      repeat_x = 'Mirror',
      hsb = dimmer,
      attachment = { Parallax = 0.1 },
    },
    {
      source = {
        File = asset_path 'Alien_Ship_bg_vert_images/Overlays/overlay_1_spines.png',
      },
      width = '100%',
      repeat_x = 'NoRepeat',
      vertical_align = 'Bottom',
      repeat_y_size = '200%',
      hsb = dimmer,
      attachment = { Parallax = 0.2 },
    },
    {
      source = {
        File = asset_path 'Alien_Ship_bg_vert_images/Overlays/overlay_2_alienball.png',
      },
      width = '100%',
      repeat_x = 'NoRepeat',
      vertical_offset = '10%',
      repeat_y_size = '200%',
      hsb = dimmer,
      attachment = { Parallax = 0.3 },
    },
    {
      source = {
        File = asset_path 'Alien_Ship_bg_vert_images/Overlays/overlay_3_lobster.png',
      },
      width = '100%',
      repeat_x = 'NoRepeat',
      vertical_offset = '30%',
      repeat_y_size = '200%',
      hsb = dimmer,
      attachment = { Parallax = 0.4 },
    },
    {
      source = {
        File = asset_path 'Alien_Ship_bg_vert_images/Overlays/overlay_4_spiderlegs.png',
      },
      width = '100%',
      repeat_x = 'NoRepeat',
      vertical_offset = '50%',
      repeat_y_size = '150%',
      hsb = dimmer,
      attachment = { Parallax = 0.5 },
    },
  }
end

return module
