#!/usr/bin/env bash

set -euo pipefail

# Inspiration for this script came from https://www.reddit.com/r/archlinux/comments/143b6we/comment/jn8zya3

echo 'xrandr --output HDMI-A-1 --off' >> /usr/share/sddm/scripts/Xsetup
echo 'xrandr --output DP-2 --off' >> /usr/share/sddm/scripts/Xsetup
echo 'xrandr --output DP-3 --off' >> /usr/share/sddm/scripts/Xsetup
