#!/usr/bin/env bash
brightness="$(brightnessctl -m | awk '{split($0,a,","); print a[4]}')"
notify-send "Brightness - $brightness"
