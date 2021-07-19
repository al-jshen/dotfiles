focused=$(i3-msg -t get_workspaces | jq -r '.[] | if .focused then .name else empty end')
has_gaps=$(i3-msg -t get_tree |jq -r --arg f $focused 'recurse(.nodes[]) | if .type == "workspace" and .name == $f then .gaps | any(.[]; . != 0) else empty end')
if [ "$has_gaps" = true ]; then
  i3-msg gaps inner current set 0;
  i3-msg gaps horizontal current set 0;
  i3-msg gaps bottom current set 0;
  i3-msg gaps top current set 35;
  i3-msg '[class=.*] border none'
else
  i3-msg gaps inner current set 20;
  i3-msg gaps horizontal current set 10;
  i3-msg gaps bottom current set 20;
  i3-msg gaps top current set 40;
  i3-msg '[class=.*] border pixel 2'
fi


