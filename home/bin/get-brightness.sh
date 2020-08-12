#!/usr/bin/env bash
xrandr --current --verbose | grep Brightness | awk '{ print $2; }'
