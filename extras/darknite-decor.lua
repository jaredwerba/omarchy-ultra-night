-- 2px edge blur for darknite only.
--
-- OmaSettings turns blur on after a theme's hyprland.lua loads, and a
-- theme installed from git is not allowed to ship Lua. This module runs
-- last. It applies only while darknite is current. Another theme reloads
-- OmaSettings first, and this block returns before touching blur.

local theme_name_file = (os.getenv("HOME") or "") .. "/.local/state/omarchy/current/theme.name"
local current = ""

local handle = io.open(theme_name_file, "r")
if handle then
  current = (handle:read("*l") or ""):gsub("%s+$", "")
  handle:close()
end

if current ~= "darknite" then
  return
end

hl.config({
  decoration = {
    rounding = 0,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    dim_inactive = false,
    shadow = {
      enabled = false,
    },
    blur = {
      enabled = true,
      size = 2,
      passes = 1,
      noise = 0.0,
      xray = true,
      ignore_opacity = false,
      new_optimizations = true,
      popups = true,
    },
  },
})
