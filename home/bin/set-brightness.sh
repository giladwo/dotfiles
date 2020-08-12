#!/usr/bin/env bash
xrandr --output $(xrandr | grep " connected" | cut -f1 -d" ") --brightness "$1"
