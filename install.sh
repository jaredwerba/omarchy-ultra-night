#!/bin/bash
# Install Omarchy Ultra Night: theme, OCR-A, 8px blur, continuous corners, red rim.
# Replaces ~/.config/omarchy/themes/ultra-night if that folder already exists.

set -u

repo_url="https://github.com/jaredwerba/omarchy-ultra-night.git"
theme_dir="${HOME}/.config/omarchy/themes/ultra-night"
hypr_lua="${HOME}/.config/hypr/hyprland.lua"
decor_dest="${HOME}/.config/hypr/darknite-decor.lua"
font_dir="${HOME}/.local/share/fonts/ocr-a"

if ! command -v omarchy >/dev/null 2>&1; then
  echo "Omarchy is not installed." >&2
  exit 1
fi

echo "Installing Ultra Night. This replaces ${theme_dir} if it is already there."
omarchy theme install "$repo_url"

if [[ ! -f ${theme_dir}/fonts/OCRA.ttf ]]; then
  echo "Theme install did not leave the OCR-A font." >&2
  exit 1
fi

mkdir -p "$font_dir"
cp "${theme_dir}/fonts/OCRA.ttf" "${font_dir}/OCRA.ttf"
fc-cache -f "$font_dir"

omarchy hook install theme-set "${theme_dir}/extras/theme-set-font"
cp "${theme_dir}/extras/darknite-decor.lua" "$decor_dest"

if [[ ! -f $hypr_lua ]]; then
  echo "Hyprland config not found: ${hypr_lua}" >&2
  exit 1
fi

if ! grep -Fq 'require("hypr.darknite-decor")' "$hypr_lua"; then
  tmp="$(mktemp)"
  if grep -Fq 'require("hypr.omasettings")' "$hypr_lua"; then
    awk '
      { print }
      /require\("hypr\.omasettings"\)/ && !done {
        print ""
        print "-- Ultra Night: 8px blur, continuous corners, red rim."
        print "require(\"hypr.darknite-decor\")"
        done = 1
      }
    ' "$hypr_lua" >"$tmp"
  else
    cat "$hypr_lua" >"$tmp"
    printf '\n-- Ultra Night: 8px blur, continuous corners, red rim.\nrequire("hypr.darknite-decor")\n' >>"$tmp"
  fi
  mv "$tmp" "$hypr_lua"
fi

omarchy theme set ultra-night
echo "Ultra Night is installed."
