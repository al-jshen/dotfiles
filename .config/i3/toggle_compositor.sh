#!/bin/bash

if pidof picom > /dev/null; then
    killall picom
else
    picom -b --experimental-backends --backend glx --config ~/.config/picom/picom.conf
fi
