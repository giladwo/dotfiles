#!/usr/bin/bash

if [[ -n "$1" ]]; then
    setxkbmap $1
else
    layout=$(setxkbmap -query | grep layout | awk '{print $2}')
    case $layout in
        us)
            setxkbmap il
            ;;
        # il)
            # setxkbmap dvorak
            # ;;
        *)
            setxkbmap us
            ;;
    esac
fi
