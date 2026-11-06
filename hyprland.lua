-- darknite. Apple Watch Ultra night mode.
-- Active border is the digit red. Inactive border is the lifted dial red.
-- A git install drops this file. colors.toml carries the same border
-- colors so the generated file stays red. The 8px blur lives in
-- extras/darknite-decor.lua because Omarchy will not stage Lua from git.

local active_border_color = "rgba(ff0000ff)"
local inactive_border_color = "rgba(410000ff)"

hl.config({
  general = {
    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
    groupbar = {
      text_color = "rgb(ff0000)",
      text_color_inactive = "rgb(8c0000)",
      col = {
        active = "rgb(1a0000)",
        inactive = "rgb(000000)",
      },
    },
  },
})
