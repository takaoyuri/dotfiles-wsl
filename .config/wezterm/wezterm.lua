local wez = require 'wezterm'

-- フォント名
local font_name = "UDEV Gothic 35NFLG"

-- タブの横幅を調整したい
wez.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local fmt = {
    { Text = '  ' .. tab.active_pane.title .. '  ' },
  }
  return fmt
end
)

return {
    font = wez.font(font_name),
    -- font = wez.font {
    --    family = 'Cica',
    --    weight = 'Bold',
    -- },
    font_size = 18,
    use_ime = true,
    enable_scroll_bar = true,
    min_scroll_bar_height = '2cell',
    window_background_opacity = 0.9,
    text_background_opacity = 0.5,
    window_frame = {
      font = wez.font(font_name),
      font_size = 18
    },
    window_decorations = "RESIZE",
    window_padding = {
      left = 0,
      right = 0,
      top = 0,
      bottom = 0
    },
    unix_domains = {
      {
        name = 'unix'
      }
    },
    default_gui_startup_args = {'connect', 'unix'},
}
