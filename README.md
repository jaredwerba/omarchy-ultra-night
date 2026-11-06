# darknite

An Omarchy theme based on the Apple Watch Ultra night mode, made for sundown.

The watch face in night mode is a black field and one red. That red is #FF0000. Every other color in this theme is the same red, turned down. Green and blue stay at zero, so the screen does not put out the light that ruins night vision after the sun is down.

## This display

Tuned on a 2020 M1 MacBook Air. The built-in panel is a 13.3-inch LED-backlit IPS, 2560 by 1600, 400 nits, wide color (P3). It is not OLED. The backlight stays on, so black is the darkest the LCD can do, not a pixel that has switched off.

The darkest reds on the watch face disappear into that backlight, and into the sky reflected in the glossy glass at dusk. The bar, cards, and secondary text are lifted to reds that still show on this panel. The accent stays #FF0000.

Hyprland on this machine color-manages the panel as sRGB. The P3 red primary is more saturated than sRGB red, and it sits outside sRGB. Sending the theme through a P3 output preset would convert #FF0000 into a drive signal that turns the green and blue subpixels back on. #FF0000 in sRGB is the purest red this pipeline can put on the glass, so the theme stays there.

## Font

The theme font is OCR-A, the public-domain face in `fonts/OCRA.ttf` (John Sauter, 2004). See `fonts/LICENSE.txt`.

Omarchy will not change the system monospace from a theme file. `extras/theme-set-font` sets OCR-A when this theme is applied and puts the previous monospace back when you leave it. Bar icons that OCR-A does not have fall back to JetBrainsMono Nerd Font.

## Blur

Window-edge blur is 8px. A faint red glow sits on the border, centered, so it reads as a rim rather than a drop shadow. A theme cloned from git cannot ship Lua, so Omarchy will not load these from this repo. `extras/darknite-decor.lua` applies them, and only while darknite is the current theme.

## Install

```bash
omarchy theme install https://github.com/jaredwerba/omarchy-darknite-theme.git
mkdir -p ~/.local/share/fonts/ocr-a
cp ~/.config/omarchy/themes/darknite/fonts/OCRA.ttf ~/.local/share/fonts/ocr-a/
fc-cache -f ~/.local/share/fonts/ocr-a
omarchy hook install theme-set ~/.config/omarchy/themes/darknite/extras/theme-set-font
cp ~/.config/omarchy/themes/darknite/extras/darknite-decor.lua ~/.config/hypr/darknite-decor.lua
```

Add this at the end of `~/.config/hypr/hyprland.lua`, after `require("hypr.omasettings")`:

```lua
require("hypr.darknite-decor")
```

Then:

```bash
omarchy theme set darknite
```
