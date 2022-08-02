#!/bin/bash
if pactl get-default-sink |rg -q "bluez_output"; then 
  echo 
  echo vol: $(pactl get-sink-volume bluez_output.4C_87_5D_CC_72_8F.a2dp-sink |cut -d' ' -f6) ;
elif
  pactl list sinks |rg "Description: Starship" -A5 |rg Mute |rg -q no; then 
  echo vol: $(pamixer --sink alsa_output.pci-0000_28_00.4.analog-stereo --get-volume)%;
else echo "%{F#666}muted%{F-}";
fi
