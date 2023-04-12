#!/usr/bin/env bash
brightness="$(brightnessctl -m -d amdgpu_bl1 | awk -F',' '{print $4}')"
notify-send "Brightness - $brightness"
