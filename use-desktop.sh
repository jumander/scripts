#!/bin/bash

gsettings set org.gnome.desktop.interface scaling-factor 1

xrandr \
  --output DP-4 --mode 2560x1440 --pos 0x0 --rate 144 --primary \
  --output DP-2 --mode 1920x1080 --pos 2560x1080 --right-of DP-4 \
  --output HDMI-0 --off
