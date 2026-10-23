#!/bin/bash

gdctl set \
  --logical-monitor --primary --monitor DP-3 --mode 2560x1440@143.856 --x 0 --y 0 --scale 1 \
  --logical-monitor --monitor DP-2 --mode 1920x1080@60.000 --x 2560 --y 360 --scale 1
