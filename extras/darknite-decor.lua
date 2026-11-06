-- Apple continuous corners and 8px edge blur for Ultra Night.
-- One theme. The folder name is ultra-night.
--
-- OmaSettings turns blur on after a theme's hyprland.lua loads, and a
-- theme installed from git is not allowed to ship Lua. This module runs
-- last. It applies only while ultra-night is current. Another theme reloads
-- OmaSettings first, and this block returns before touching blur.

local theme_name_file = (os.getenv("HOME") or "") .. "/.local/state/omarchy/current/theme.name"
local current = ""

local handle = io.open(theme_name_file, "r")
if handle then
  current = (handle:read("*l") or ""):gsub("%s+$", "")
  handle:close()
end

if current ~= "ultra-night" then
  return
end

hl.config({
  decoration = {
    rounding = 10,
    rounding_power = 4.0,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    dim_inactive = false,
    -- A faint red rim. Offset is zero so it hugs the border instead of
    -- dropping. The falloff is steep so the black field stays black.
    shadow = {
      enabled = true,
      range = 6,
      render_power = 4,
      sharp = false,
      offset = { 0, 0 },
      scale = 1.0,
      color = "rgba(ff000024)",
      color_inactive = "rgba(ff000012)",
    },
    blur = {
      enabled = true,
      size = 8,
      passes = 1,
      noise = 0.0,
      xray = true,
      ignore_opacity = false,
      new_optimizations = true,
      popups = true,
    },
  },
})
