#!/bin/bash

# Make sure gdctl has properly started
until gdctl show >/dev/null 2>&1; do sleep 0.3; done

gdctl set \
  --logical-monitor --primary --monitor HDMI-1 --mode 3840x2160@119.880 --x 0 --y 0 --scale 2

# Change audio source
TV_SINK_ID=$(wpctl status | awk '/HDMI/ {if (match($0, /[0-9]+\./)) {print substr($0, RSTART, RLENGTH-1); exit}}')
TV_VOLUME=75%

wpctl set-default "$TV_SINK_ID"
wpctl set-volume "$TV_SINK_ID" "$TV_VOLUME"
