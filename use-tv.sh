#!/bin/bash

# Make sure xrandr has properly started
until xrandr --query >/dev/null 2>&1; do
  sleep 0.3
done

gsettings set org.gnome.desktop.interface scaling-factor 2

xrandr \
  --output DP-4 --off \
  --output DP-2 --off \
  --output HDMI-0 --mode 3840x2160 --rate 120

#Change audio source
TV_SINK_ID=$(wpctl status | awk '/HDMI/ {if (match($0, /[0-9]+\./)) {print substr($0, RSTART, RLENGTH-1); exit}}')
TV_VOLUME=75%

wpctl set-default "$TV_SINK_ID"
wpctl set-volume "$TV_SINK_ID" "$TV_VOLUME"
