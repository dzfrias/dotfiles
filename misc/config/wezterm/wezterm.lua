local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'tokyonight_night'
config.window_decorations = 'RESIZE'
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font 'MesloLGM Nerd Font'
config.font_size = 12.0
config.macos_window_background_blur = 9
config.front_end = 'WebGpu'

config.hyperlink_rules = wezterm.default_hyperlink_rules()
table.insert(config.hyperlink_rules, {
  regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
  format = 'https://www.github.com/$1/$3',
})

return config
