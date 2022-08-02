if pactl list sources |rg -q jack_in; then
  if pactl list sources |rg jack_in -A20 |rg -q "Mute: no"; then
    echo "%{B#2e3440}%{u#5e81ac}%{+u}mic on%{-u B-}"; 
  else echo "%{F#666}mic off%{F-}"; 
  fi;
elif pactl list sources |rg alsa_input.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.analog-stereo -A20 |rg -q "Mute: no"; then 
  echo "%{B#2e3440}%{u#5e81ac}%{+u}mic on%{-u B-}"; 
else echo "%{F#666}mic off%{F-}"; 
fi 
