local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local act = wezterm.action

-- color
config.color_scheme = 'Catppuccin Mocha (Gogh)'

-- fonts
config.font = wezterm.font_with_fallback {
  { family = 'JetBrainsMono Nerd Font', weight = 'Bold' },
  { family = 'Fira Code', weight = 'Bold' },
}
config.font_size = 16.0
config.harfbuzz_features = { 'zero', 'liga=1' }
config.adjust_window_size_when_changing_font_size = false

-- tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- background
config.window_background_opacity = 1.0
-- config.macos_window_background_blur = 50

-- key bindings
config.keys = {
  {
    key = 't',
    mods = 'CMD|SHIFT',
    action = act.ShowTabNavigator,
  },
  {
    key = 'w',
    mods = 'CMD|OPT',
    action = act.CloseCurrentPane { confirm = true },
  },
}

return config
