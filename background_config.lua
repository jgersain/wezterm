local module = {}

function getPicturePath()
  local sys = package.config:sub(1, 1) == "\\" and "Windows" or "Linux"

  local base_path
  if sys == "Linux" then
      base_path = "/home/"
  elseif sys == "Windows" then
      base_path = "C:/Users/"
  else
      error("No support")
  end

  local user = os.getenv("USER") or os.getenv("USERNAME")
  if not user then
      error("No se pudo determinar el usuario actual.")
  end

  local picture_path = base_path .. user .. "/Pictures"
  picture_path = picture_path:gsub("\\", "/")

  return picture_path
end

function module.set_background(config)  
  -- The art is a bit too bright and colorful to be useful as a backdrop
  -- for text, so we're going to dim it down to 10% of its normal brightness
  local dimmer = { brightness = 0.05 }

  config.cursor_blink_rate = 800
  config.enable_scroll_bar = true
  config.min_scroll_bar_height = '2cell'
  config.colors = {
    scrollbar_thumb = 'gray',
  }
  config.color_scheme = 'Github'
  -- Gradient setup
  -- config.window_background_gradient = {
  --   colors = { '#302b63', '#0f0c29' },
  --   -- colors = { '#600B0B', '#0B0B60' },
  --   orientation = {
  --     Radial = {
  --       cx = 0.35,
  --       cy = 0.35,
  --       radius = 0.5,
  --     },
  --     -- Linear = { angle = -45.0 }
  --   },
  -- }
  -- Background gif setup
  config.background = {
    {
      source = {
        File = getPicturePath() .. '/terminal04.gif'
      },
      hsb = dimmer,
    }
  }
  -- config.window_background_gradient = {
  --   orientation = 'Vertical',
  --   colors = {
  --     '#0f0c29',
  --     '#302b63',
  --     '#0f0c29',
  --   },
  --   interpolation = 'Linear',
  --   blend = 'Rgb',
  -- }
  -- config.background = {
  --   -- This is the deepest/back-most layer. It will be rendered first
  --   {
  --     source = {
  --       File = picturePath .. '/Alien_Ship_bg_vert_images/Backgrounds/spaceship_bg_1.png',
  --     },
  --     -- The texture tiles vertically but not horizontally.
  --     -- When we repeat it, mirror it so that it appears "more seamless".
  --     -- An alternative to this is to set `width = "100%"` and have
  --     -- it stretch across the display
  --     repeat_x = 'Mirror',
  --     hsb = dimmer,
  --     -- When the viewport scrolls, move this layer 10% of the number of
  --     -- pixels moved by the main viewport. This makes it appear to be
  --     -- further behind the text.
  --     attachment = { Parallax = 0.1 },
  --   },
  --   -- Subsequent layers are rendered over the top of each other
  --   {
  --     source = {
  --       File = picturePath .. '/Alien_Ship_bg_vert_images/Overlays/overlay_1_spines.png',
  --     },
  --     width = '100%',
  --     repeat_x = 'NoRepeat',
  
  --     -- position the spins starting at the bottom, and repeating every
  --     -- two screens.
  --     vertical_align = 'Bottom',
  --     repeat_y_size = '200%',
  --     hsb = dimmer,
  
  --     -- The parallax factor is higher than the background layer, so this
  --     -- one will appear to be closer when we scroll
  --     attachment = { Parallax = 0.2 },
  --   },
  --   {
  --     source = {
  --       File = picturePath .. '/Alien_Ship_bg_vert_images/Overlays/overlay_2_alienball.png',
  --     },
  --     width = '100%',
  --     repeat_x = 'NoRepeat',
  
  --     -- start at 10% of the screen and repeat every 2 screens
  --     vertical_offset = '10%',
  --     repeat_y_size = '200%',
  --     hsb = dimmer,
  --     attachment = { Parallax = 0.3 },
  --   },
  --   {
  --     source = {
  --       File = picturePath .. '/Alien_Ship_bg_vert_images/Overlays/overlay_3_lobster.png',
  --     },
  --     width = '100%',
  --     repeat_x = 'NoRepeat',
  
  --     vertical_offset = '30%',
  --     repeat_y_size = '200%',
  --     hsb = dimmer,
  --     attachment = { Parallax = 0.4 },
  --   },
  --   {
  --     source = {
  --       File = picturePath .. '/Alien_Ship_bg_vert_images/Overlays/overlay_4_spiderlegs.png',
  --     },
  --     width = '100%',
  --     repeat_x = 'NoRepeat',
  
  --     vertical_offset = '50%',
  --     repeat_y_size = '150%',
  --     hsb = dimmer,
  --     attachment = { Parallax = 0.5 },
  --   },
  -- }
end

return module
